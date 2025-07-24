import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../model/on_time_card_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://api.example.com")
//BAKILACAK buraya sanırım backend kısmı yapışacak
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/ontimecards")
  Future<List<OnTimeCardModel>> getOnTimeCards();

  @GET("/ontimecards/{id}")
  Future<OnTimeCardModel> getOnTimeCard(@Path("id") int id);

  @POST("/ontimecards")
  Future<OnTimeCardModel> createOnTimeCard(@Body() OnTimeCardModel card);

  @PUT("/ontimecards/{id}")
  Future<OnTimeCardModel> updateOnTimeCard(
      @Path("id") int id, @Body() OnTimeCardModel card);

  @DELETE("/ontimecards/{id}")
  Future<void> deleteOnTimeCard(@Path("id") int id);
}
