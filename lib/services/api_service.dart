import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../model/on_time_card_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://localhost:7163/api/TaskCard")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/getTaskCards")
  Future<List<OnTimeCardModel>> getOnTimeCards();

  @POST("/addTaskCards")
  Future<OnTimeCardModel> createOnTimeCard(@Body() OnTimeCardModel card);

  @GET("/getTaskCards/{id}")
  Future<OnTimeCardModel> getOnTimeCard(@Path("id") int id);

  @PUT("/updateTaskCards/{id}")
  Future<OnTimeCardModel> updateOnTimeCard(
      @Path("id") int id, @Body() OnTimeCardModel card);

  @DELETE("/deleteTaskCards/{id}")
  Future<void> deleteOnTimeCard(@Path("id") int id);
}
