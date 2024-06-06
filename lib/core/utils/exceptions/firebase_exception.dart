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
      case 'credential-already-in-use':
        return 'The account corresponding to this credential already exists.';
      case 'operation-not-allowed':
        return 'The requested operation is not allowed.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.';
      case 'invalid-credential':
        return 'The provided credential is malformed or has expired.';
      case 'invalid-verification-code':
        return 'The verification code is invalid.';
      case 'quota-exceeded':
        return 'The SMS quota for the project has been exceeded.';
      case 'missing-iframe-start':
        return 'The email template does not contain the required iframe start tag.';
      case 'missing-iframe-end':
        return 'The email template does not contain the required iframe end tag.';
      case 'missing-iframe-src':
        return 'The email template does not contain the required iframe src attribute.';
      case 'auth-domain-config-required':
        return 'The auth domain configuration is required.';
      case 'missing-app-credential':
        return 'The Firebase app is not configured with a valid API key.';
      case 'session-cookie-expired':
        return 'The session cookie is expired.';
      case 'session-cookie-revoked':
        return 'The session cookie has been revoked.';
      case 'uid-already-exists':
        return 'The uid already exists. Please try again with a different uid.';
      case 'web-storage-unsupported':
        return 'The browser does not support web storage.';
      case 'user-token-expired':
        return 'The user token is expired. Please sign in again.';
      case 'app-deleted':
        return 'The Firebase app has been deleted.';
      default:
        return 'An error occurred. Please try again.';
    }
  }
}
