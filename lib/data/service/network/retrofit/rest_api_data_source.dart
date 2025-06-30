import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'rest_api_data_source.g.dart';

@RestApi()
abstract class RestApiDataSource {
  factory RestApiDataSource(Dio dio, {String baseUrl}) = _RestApiDataSource;

  // @POST(ApiConfigs.login)
  // Future login(@Body() LoginRequestModel request);
}
