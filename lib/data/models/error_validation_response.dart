class ErrorValidationResponse implements Exception {
  final bool success;
  final String message;
  final Map<String, List<String>> errors;

  ErrorValidationResponse({
    required this.success,
    required this.message,
    required this.errors,
  });

  factory ErrorValidationResponse.fromJson(Map<String, dynamic> json) {
    Map<String, List<String>> parsedErrors = {};

    if (json['errors'] != null) {
      final errorsData = json['errors'];

      if (errorsData is Map<String, dynamic>) {
        errorsData.forEach((key, value) {
          if (value is List) {
            parsedErrors[key] = value.map((e) => e.toString()).toList();
          } else if (value is String) {
            parsedErrors[key] = [value];
          }
        });
      }
    }

    return ErrorValidationResponse(
      success: json['success'],
      message: json['message']?.toString() ?? 'Validation error occurred',
      errors: parsedErrors,
    );
  }

  String get firstErrorMessage {
    if (message.isNotEmpty && message != 'Validation Error.') {
      return message;
    }

    if (errors.isNotEmpty) {
      final firstFieldErrors = errors.values.first;
      if (firstFieldErrors.isNotEmpty) {
        return firstFieldErrors.first;
      }
    }

    return message.isNotEmpty ? message : 'Unknown error occurred';
  }

  List<String> getFieldErrors(String field) {
    return errors[field] ?? [];
  }

  bool hasFieldError(String field) {
    return errors.containsKey(field) && errors[field]!.isNotEmpty;
  }

  List<String> get allErrorMessages {
    List<String> messages = [];

    if (message.isNotEmpty && message != 'Validation Error.') {
      messages.add(message);
    }

    for (var errorList in errors.values) {
      messages.addAll(errorList);
    }

    return messages;
  }

  @override
  String toString() {
    return 'ErrorValidationResponse(message: $message, errors: $errors)';
  }
}
