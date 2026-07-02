// class AadhaarApiException implements Exception {
//   final String message;
//   final String? code;
//   final String? type;

//   AadhaarApiException(this.message, {this.code, this.type});

//   @override
//   String toString() {
//     String result = 'AadhaarApiException: $message';
//     if (code != null) {
//       result += ' (Code: $code)';
//     }
//     if (type != null) {
//       result += ' (Type: $type)';
//     }
//     return result;
//   }
// }

// lib/core/common/error_handling/aadhaar_exception.dart

class AadhaarApiException implements Exception {
  final String message;
  final String? code;
  final String? type;

  const AadhaarApiException(this.message, {this.code, this.type});

  @override
  String toString() {
    // This toString() is what gets called if you use e.toString()
    // but we want to avoid that in our UI display for this specific case.
    // However, it's good for debug logs.
    return 'AadhaarApiException: $message' +
        (code != null ? ' (Code: $code)' : '') +
        (type != null ? ' (Type: $type)' : '');
  }
}
