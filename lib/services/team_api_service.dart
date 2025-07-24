import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/technician_model.dart';

part 'team_api_service.g.dart';

@RestApi(baseUrl: 'https://api.my-mro.com')
abstract class TeamApiService {
  factory TeamApiService(Dio dio, {String baseUrl}) = _TeamApiService;

  @GET('/facility/{facilityId}/technicians')
  Future<List<Technician>> getTeam(@Path() String facilityId);

  @POST('/facility/{facilityId}/technicians/add')
  Future<void> addTechnician(@Path() String facilityId, @Body() Technician technician);

  @POST('/facility/{facilityId}/technicians/remove')
  Future<void> removeTechnician(@Path() String facilityId, @Body() Technician technician);
}
