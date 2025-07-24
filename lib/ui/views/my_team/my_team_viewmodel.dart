import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedproject/model/technician_model.dart';
import 'package:stackedproject/services/team_api_service.dart';

class MyTeamViewModel extends BaseViewModel {
  final TeamApiService _api = TeamApiService(Dio());

  Future<void> loadTeam(String facilityId) async {
    setBusy(true);
    try {
      List<Technician> team = await _api.getTeam(facilityId);
    }  finally {
      setBusy(false);
    }
  }

  Future<void> addTechnician(String facilityId, Technician technician) async {
    await _api.addTechnician(facilityId, technician);
  }

  Future<void> removeTechnician(String facilityId, Technician technician) async {
    await _api.removeTechnician(facilityId, technician);
  }
}

