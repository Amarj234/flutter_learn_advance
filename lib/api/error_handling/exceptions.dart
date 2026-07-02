// file: lib/core/error/exception.dart

class ServerException implements Exception {
  final String message;
  final int? statusCode;

  ServerException(this.message, {this.statusCode});

  @override
  String toString() => 'ServerException: $message (Status: $statusCode)';
}

class CacheException implements Exception {
  final String message;
  CacheException(this.message);

  @override
  String toString() => 'CacheException: $message';
}

// UNCOMMENTED AND FIXED: FetchDataException
class FetchDataException implements Exception {
  final String message;
  final int? statusCode;

  FetchDataException(this.message, {this.statusCode});

  @override
  String toString() => 'FetchDataException: $message (Status: $statusCode)';
}

// UNCOMMENTED AND FIXED: UnauthorisedException
class UnauthorisedException implements Exception {
  final String message;
  final int? statusCode;

  UnauthorisedException(this.message, {this.statusCode});

  @override
  String toString() => 'UnauthorisedException: $message (Status: $statusCode)';
}

class CustomException implements Exception {
  final String message;
  final String prefix;

  CustomException(this.message, this.prefix);

  @override
  String toString() {
    return '$prefix$message';
  }
}

// class FetchDataException extends CustomException {
//   FetchDataException([String message = 'Error During Communication'])
//       : super(message, '');
// }

class BadRequestException extends CustomException {
  BadRequestException([String message = 'Bad Request']) : super(message, '');
}

// class UnauthorisedException extends CustomException {
//   UnauthorisedException([String message = 'Unauthorised'])
//       : super(message, '');
// }

class InvalidInputException extends CustomException {
  InvalidInputException([String message = 'Invalid Input'])
      : super(message, '');
}

class MaintenanceException extends CustomException {
  MaintenanceException([String message = 'Under Maintenance'])
      : super(message, '');
}
