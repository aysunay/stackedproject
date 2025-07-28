import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:stackedproject/model/technician_model.dart';

part 'team_api_service.g.dart';

@RestApi(baseUrl: "http://localhost/api")
abstract class TeamApiService {
  factory TeamApiService(Dio dio, {String baseUrl}) = _TeamApiService;

  @POST('/technicians')
  Future<Technician> addTechnician({
    @Field('name') required String name,
    @Field('role') required String role,
  });

  @GET('/teams/{facilityId}/technicians')
  Future<List<Technician>> getTechnicians(@Path('facilityId') String facilityId);

  @DELETE('/technicians/{id}')
  Future<void> deleteTechnician(@Path('id') String id);
}
