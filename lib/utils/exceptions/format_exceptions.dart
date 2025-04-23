class CustomFormatException implements Exception {
  final String message;

  CustomFormatException([
    this.message =
        'An Unexpected Format Error Occurred. Please Check Your Input.',
  ]);

  factory CustomFormatException.fromMessage(String message) {
    return CustomFormatException(message);
  }

  String get formattedMessage => message;

  factory CustomFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return CustomFormatException(
          'The Email Address Format Is Invalid. Please Enter A Valid Email.',
        );
      case 'invalid-phone-number-format':
        return CustomFormatException(
          'The Provided Phone Number Format Is Invalid. Please Enter A Valid Number.',
        );
      case 'invalid-date-format':
        return CustomFormatException(
          'The Date Format Is Invalid. Please Enter A Valid Date.',
        );
      case 'invalid-url-format':
        return CustomFormatException(
          'The URL Format Is Invalid. Please Enter A Valid URL.',
        );
      case 'invalid-credit-card-format':
        return CustomFormatException(
          'The Credit Card Format Is Invalid. Please Enter A Valid Credit Card Number.',
        );
      case 'invalid-numeric-format':
        return CustomFormatException(
          'The Input Should Be A Valid Numeric Format.',
        );
      default:
        return CustomFormatException();
    }
  }
}
