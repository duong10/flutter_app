import 'dart:async';

import 'app_exception.dart';

/// The [AppExceptionWrapper], which only use in presentation layer
class AppExceptionWrapper {
  final AppException appException;
  final String commonExceptionMessage;
  final String? overrideMessage;
  final ExceptionDisplayStyle? displayStyle;
  final FutureOr<void> Function()? onRetry;

  AppExceptionWrapper(
    this.appException, {
    String? commonExceptionMessage,
    this.overrideMessage,
    this.displayStyle = ExceptionDisplayStyle.toast,
    this.onRetry,
  }) : commonExceptionMessage = commonExceptionMessage ?? "Lỗi kết nối";

  String get errorMessageDisplayed {
    return overrideMessage ?? appException.message ?? commonExceptionMessage;
  }
}

enum ExceptionDisplayStyle { toast, dialog }
