import 'dart:async';
import 'package:signalr_core/signalr_core.dart';
import 'package:stackedproject/model/technician_model.dart';

class SignalRService {
  final _hubConnection = HubConnectionBuilder()
      .withUrl(
        'http://localhost:5044/hubs/team',
        HttpConnectionOptions(
          logging: (level, message) => print('SignalR: $message'),
        ),
      )
      .build();

  Function(Technician)? onTechnicianAdded;
  Function(String technicianId)? onTechnicianRemoved;

  HubConnectionState _connectionState = HubConnectionState.disconnected;
  HubConnectionState get connectionState => _connectionState;
  bool get isConnected => _connectionState == HubConnectionState.connected;

  String get connectionStatusLabel {
    switch (_connectionState) {
      case HubConnectionState.connected:
        return "Connected";
      case HubConnectionState.connecting:
        return "Connecting...";
      case HubConnectionState.reconnecting:
        return "Reconnecting...";
      case HubConnectionState.disconnected:
      default:
        return "Disconnected";
    }
  }

  Future<void> connect() async {
    if (_hubConnection.state == HubConnectionState.connected) return;

    _hubConnection.onclose((error) async {
      _connectionState = HubConnectionState.disconnected;
      print("SignalR disconnected. Reconnecting in 5s...");
      await Future.delayed(const Duration(seconds: 5));
      await connect();
    });

    _hubConnection.on('TechnicianAdded', (args) {
      if (args != null && args.isNotEmpty) {
        final tech = Technician.fromJson(args[0] as Map<String, dynamic>);
        onTechnicianAdded?.call(tech);
      }
    });

    _hubConnection.on('TechnicianRemoved', (args) {
      if (args != null && args.isNotEmpty) {
        final techId = args[0] as String;
        onTechnicianRemoved?.call(techId);
      }
    });

    try {
      await _hubConnection.start();
      _connectionState = HubConnectionState.connected;
      print("SignalR connected.");
    } catch (e) {
      _connectionState = HubConnectionState.disconnected;
      print("SignalR connection failed: $e");
    }
  }

  Future<void> disconnect() async {
    try {
      await _hubConnection.stop();
      _connectionState = HubConnectionState.disconnected;
      print("SignalR disconnected manually.");
    } catch (e) {
      print("Error during disconnect: $e");
    }
  }
}
