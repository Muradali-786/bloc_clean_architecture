class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message$_prefix';
  }
}

class InternetException extends AppException {
  InternetException([String? message])
      : super(message, 'No Internet Exception');
}

class UnAuthorizeRequest extends AppException {
  UnAuthorizeRequest([String? message])
      : super(message, "you don't have access to this");
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, '');
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message, 'request time out');
}
