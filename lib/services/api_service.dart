import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../model/on_time_card_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://localhost:7163/api")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/getTaskCards")
  Future<List<OnTimeCardModel>> getOnTimeCards();

  @POST("/addTaskCard")
  Future<OnTimeCardModel> createOnTimeCard(@Body() OnTimeCardModel card);

  @GET("/getTaskCard/{id}")
  Future<OnTimeCardModel> getOnTimeCard(@Path("id") int id);

  @PUT("/updateTaskCard/{id}")
  Future<OnTimeCardModel> updateOnTimeCard(@Path("id") int id, @Body() OnTimeCardModel card);

  @DELETE("/deleteTaskCard/{id}")
  Future<void> deleteOnTimeCard(@Path("id") int id);
}
