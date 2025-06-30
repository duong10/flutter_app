import 'package:dio/dio.dart';

import 'base_interceptor.dart';

class LanguageInterceptor extends BaseInterceptor {
  @override
  int get priority => BaseInterceptor.languagePriority;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final rootBloc = getIt.get<RootAppBloc>();
    // options.headers['Accept-Language'] = rootBloc.state.locale.languageCode;

    super.onRequest(options, handler);
  }
}
