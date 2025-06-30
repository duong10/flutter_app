import 'package:dio/dio.dart';

import '../../../../shared/exceptions/remote_exception.dart';
import '../../../../shared/helper/network_connectivity_helper.dart';
import 'base_interceptor.dart';

class ConnectivityInterceptor extends BaseInterceptor {
  @override
  int get priority => BaseInterceptor.connectivityPriority;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (NetworkConnectivityHelper().networkStatus.isOffline) {
      return handler.reject(
        DioException(requestOptions: options, error: NoInternetException()),
      );
    }

    super.onRequest(options, handler);
  }
}
