class MPFormatException implements Exception {
  final String message;

  const MPFormatException([this.message = 'An unexpected format error occurred. Please check your input.']);

  factory MPFormatException.fromMessage(String message) {
    return MPFormatException(message);
  }
  String get formattedMessage => message;

  factory MPFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const MPFormatException('The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const MPFormatException('The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const MPFormatException('The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const MPFormatException('The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const MPFormatException('The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const MPFormatException('The input should be a valid numeric format.');
      default:
        return const MPFormatException();
    }
  }
}