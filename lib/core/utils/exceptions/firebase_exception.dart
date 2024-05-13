class AppFirebaseException implements Exception {
  final String code;

  const AppFirebaseException(this.code);

// Get the corresponding error message based on the error code
  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occurred. Please try again.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-not-found':
        return 'User not found. Please check your credentials.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'custom-token-mismatch':
        return 'The custom token provided does not match.';
      case 'invalid-custom-token':
        return 'The custom token provided is invalid.';
      case 'provider-already-linked':
        return 'The account is already linked with this provider.';
      default:
        return 'An error occurred. Please try again.';
    }
  }
}
