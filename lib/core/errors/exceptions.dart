abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() => message;
}

// Network Exceptions
class NetworkException extends AppException {
  NetworkException({required super.message});
}

class TimeoutException extends AppException {
  TimeoutException({String? message})
      : super(message: message ?? 'Connection timeout');
}

class RequestCancelledException extends AppException {
  RequestCancelledException({String? message})
      : super(message: message ?? 'Request was cancelled');
}

// Server Exceptions
class ServerException extends AppException {
  ServerException({
    required super.message,
    super.statusCode,
  });
}

class BadRequestException extends AppException {
  BadRequestException({required super.message}) : super(statusCode: 400);
}

class UnauthorizedException extends AppException {
  UnauthorizedException({String? message})
      : super(
          message: message ?? 'Unauthorized access',
          statusCode: 401,
        );
}

class ForbiddenException extends AppException {
  ForbiddenException({String? message})
      : super(
          message: message ?? 'Access forbidden',
          statusCode: 403,
        );
}

class NotFoundException extends AppException {
  NotFoundException({String? message})
      : super(
          message: message ?? 'Resource not found',
          statusCode: 404,
        );
}

class CertificateException extends AppException {
  CertificateException({required super.message});
}

class UnknownException extends AppException {
  UnknownException({String? message})
      : super(message: message ?? 'An unknown error occurred');
}

// Cache Exception
class CacheException implements Exception {
  final String message;

  CacheException({this.message = 'Cache error occurred'});

  @override
  String toString() => message;
}

// Format Exception
class FormatException extends AppException {
  FormatException({String? message})
      : super(message: message ?? 'Invalid data format');
}
class ConflictException implements Exception {
  final String message;

  ConflictException({required this.message});

  @override
  String toString() => message;
}
