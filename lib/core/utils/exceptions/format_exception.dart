class AppFormatException implements Exception {
  final String message;
  const AppFormatException(
      {this.message = 'An unexpected error occurred. Please try again.'});

  factory AppFormatException.fromMessage(String message) {
    return AppFormatException(message: message);
  }

  String get formattedMessage => message;

// Create a format exception from a specific error code.
  factory AppFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const AppFormatException(message: 'Invalid email address.');
      case 'user-disabled':
        return const AppFormatException(message: 'Your account has been disabled.');
      case 'user-not-found':
        return const AppFormatException(message: 'User not found.');
      case 'wrong-password':
        return const AppFormatException(message: 'Wrong password.');
      case 'email-already-in-use':
        return const AppFormatException(message: 'Email already in use.');
      default:
        return const AppFormatException(
            message: 'An unexpected error occurred. Please try again.');
    }
  }
}
