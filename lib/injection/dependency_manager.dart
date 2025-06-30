import '../data/service/network/configs/api_configs.dart';
import '../data/service/network/dio_http_client_builder.dart';
import '../data/service/network/interceptor/access_token_interceptor.dart';
import '../data/service/network/interceptor/cache_request_interceptor.dart';
import '../data/service/network/interceptor/error_interceptor.dart';
import '../data/service/network/interceptor/language_interceptor.dart';
import '../data/service/network/interceptor/refresh_token_interceptor.dart';
import '../data/service/network/interceptor/retry_on_error_interceptor.dart';
import '../data/service/network/retrofit/rest_api_data_source.dart';
import 'injector.dart';

class DependencyManager {
  static Future<void> inject() async {
    //getIt.registerLazySingleton<LoginBloc>(() => LoginBloc());

    getIt.registerLazySingleton<RestApiDataSource>(
      () => RestApiDataSource(
        DioHttpClientBuilder.createDio(
          interceptors:
              (dio) => [
                CacheRequestInterceptor(),
                ErrorInterceptor(),
                LanguageInterceptor(),
                AccessTokenInterceptor(),
                RefreshTokenInterceptor(dio),
                RetryOnErrorInterceptor(dio),
              ],
        ),
        baseUrl: ApiConfigs.baseUrl,
      ),
    );
    // final hiveClient = await HiveClient.create();
    // getIt.registerSingleton<HiveClient>(hiveClient);
    await configureDependencies();
  }
}
