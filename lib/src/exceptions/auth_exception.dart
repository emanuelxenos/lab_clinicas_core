sealed class AuthException implements Exception {
  final String message;

  AuthException({required this.message});
}

final class AtuhError extends AuthException {
  AtuhError({required super.message});
}

final class AuthUnathorizedException extends AuthException {
  AuthUnathorizedException() : super(message: '');
}
