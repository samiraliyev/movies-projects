import 'dart:async';

import 'auth_interceptor.dart';

/// The interface for token storage.
///
/// This interface is used by the [AuthInterceptor]
/// to store and retrieve the Auth token pair.
abstract interface class TokenStorage {
  /// Load the Auth token pair.
  Future<TokenPair?> loadTokenPair();

  /// Load the Auth token pair.
  Future<String?> loadTemporaryToken();

  /// Save the Auth token pair.
  Future<void> saveTokenPair(TokenPair tokenPair);

  /// Save the Auth token pair.
  Future<void> saveTemporaryToken(String token);

  /// Clear the Auth token pair.
  ///
  /// This is used to clear the token pair when the request fails with a 401.
  Future<void> clearTokenPair();

  /// A stream of token pairs.
  Stream<TokenPair?> getTokenPairStream();

  /// Close the token storage.
  Future<void> close();

  /// access token from token storage
  Future<String?> get accessToken;

  /// refresh token from token storage
  Future<String?> get refreshToken;

  /// temporary token from token storage
  Future<String?> get temporaryToken;
}
