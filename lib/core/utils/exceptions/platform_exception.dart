class AppPlatformException implements Exception {
  final String code;

  const AppPlatformException(this.code);

// Get the corresponding error message based on the error code
  String get message {
    switch (code) {
    case 'ERROR_INVALID_EMAIL':
      return 'The email address is not valid.';
    case 'ERROR_USER_NOT_FOUND':
      return 'User not found. Please check your credentials.';
    case 'ERROR_WRONG_PASSWORD':
      return 'Incorrect password. Please try again.';
    case 'ERROR_USER_DISABLED':
      return 'This user account has been disabled.';
    case 'ERROR_EMAIL_ALREADY_IN_USE':
      return 'The email address is already in use by another account.';
    case 'ERROR_WEAK_PASSWORD':
      return 'The password is too weak.';
    default:
      return 'An error occurred. Please try again.';
  }
  }
}
