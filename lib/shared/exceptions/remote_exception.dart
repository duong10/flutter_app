import 'app_exception.dart';

class RemoteException extends AppException {
  final Map<String, dynamic>? responseData;

  RemoteException({super.message, super.messageCode, this.responseData});
}

class NoInternetException extends RemoteException {
  NoInternetException({String? message, super.messageCode})
    : super(message: message ?? 'S.current.khong_co_ket_noi_mang');
}

class ConnectionTimeoutException extends RemoteException {
  ConnectionTimeoutException({super.message, super.messageCode});
}

class BadCertificateException extends RemoteException {
  BadCertificateException({super.message, super.messageCode});
}

class BadResponseException extends RemoteException {
  BadResponseException({super.message, super.messageCode, super.responseData});
}

class CancelledRequestException extends RemoteException {
  CancelledRequestException({super.message, super.messageCode});
}

class ServerException extends RemoteException {
  ServerException({super.message, super.messageCode});
}

class UnauthorizedException extends RemoteException {
  UnauthorizedException({super.message, super.messageCode});
}
