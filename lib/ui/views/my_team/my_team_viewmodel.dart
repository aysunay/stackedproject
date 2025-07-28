import 'package:stacked/stacked.dart';
import 'package:stackedproject/model/technician_model.dart';
import 'package:stackedproject/app/app.locator.dart';
import 'package:stackedproject/services/auth_service.dart';
import 'package:stackedproject/services/team_api_service.dart';
import 'package:stackedproject/services/signalr_service.dart';
import 'package:signalr_core/signalr_core.dart';

class MyTeamViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final _teamApiService = locator<TeamApiService>();
  final _signalRService = locator<SignalRService>();

  final ReactiveList<Technician> _technicians = ReactiveList<Technician>();
  List<Technician> get technicians => _technicians;

  bool get isTeamLeader => true;

  @override
  List<ListenableServiceMixin> get listenableServices => [];

  bool get isConnected =>
      _signalRService.connectionState == HubConnectionState.connected;

  String get connectionStatusLabel {
    switch (_signalRService.connectionState) {
      case HubConnectionState.connected:
        return 'Connected';
      case HubConnectionState.connecting:
        return 'Connecting...';
      case HubConnectionState.reconnecting:
        return 'Reconnecting...';
      case HubConnectionState.disconnected:
      default:
        return 'Disconnected';
    }
  }

  Future<void> addTechnician(String name, String role) async {
    try {
      final newTech = await runBusyFuture(
          _teamApiService.addTechnician(name: name, role: role));
      _technicians.add(newTech);
    } catch (e) {
      setError("Technician add failed: $e");
    }
  }

  Future<void> removeTechnician(String technicianId) async {
    try {
      await runBusyFuture(_teamApiService.deleteTechnician(technicianId));
      _technicians.removeWhere((tech) => tech.id == technicianId);
    } catch (e) {
      setError("Technician delete failed: $e");
    }
  }

  Future<void> loadTeam(String facilityId) async {
    try {
      final team =
          await runBusyFuture(_teamApiService.getTechnicians(facilityId));
      _technicians.clear();
      _technicians.addAll(team);
    } catch (e) {
      setError("Team load error: $e");
    }
  }

  void initSignalR() {
    _signalRService.connect();

    _signalRService.onTechnicianAdded = (technician) {
      _technicians.add(technician);
      notifyListeners();
    };

    _signalRService.onTechnicianRemoved = (technicianId) {
      _technicians.removeWhere((t) => t.id == technicianId);
      notifyListeners();
    };
  }
}
