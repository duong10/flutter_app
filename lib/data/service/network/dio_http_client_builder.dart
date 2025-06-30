import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';

import 'api_client_default_settings.dart';
import 'configs/network_config.dart';
import 'interceptor/base_interceptor.dart';

class DioHttpClientBuilder {
  static Dio createDio({
    BaseOptions? options,
    List<Interceptor> Function(Dio dio)? interceptors,
  }) {
    final Dio dio = Dio(
      BaseOptions(
        contentType: options?.contentType ?? NetworkConfig.contentType,
        receiveTimeout: options?.receiveTimeout ?? NetworkConfig.receiveTimeout,
        connectTimeout: options?.connectTimeout ?? NetworkConfig.connectTimeout,
        sendTimeout: options?.sendTimeout ?? NetworkConfig.sendTimeout,
      ),
    );

    final List<Interceptor> sortedInterceptors =
        [
            ...ApiClientDefaultSettings.requiredInterceptors(), // Thêm các interceptor mặc định
            ...?interceptors?.call(
              dio,
            ), //  Thêm các interceptor tùy chỉnh (nếu có)
          ]
          ..distinct() // Loại bỏ các phần tử trùng lặp
          ..sortedByDescending(
            (element) =>
                element is BaseInterceptor
                    ? element.priority
                    : -1, // Sắp xếp theo priority
          );

    dio.interceptors.addAll(sortedInterceptors);
    return dio;
  }
}
