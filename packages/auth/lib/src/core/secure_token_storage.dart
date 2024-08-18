import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth_interceptor.dart';
import 'token_storage.dart';

const _accessToken = 'accessToken';
const _refreshToken = 'refreshToken';
const _temporaryToken = 'temporaryToken';

final class SecureTokenStorage implements TokenStorage {
  SecureTokenStorage(this.secureStorage);

  final FlutterSecureStorage secureStorage;
  final _controller = StreamController<TokenPair?>.broadcast();

  @override
  Future<void> clearTokenPair() async {
    await secureStorage.delete(key: _accessToken);
    await secureStorage.delete(key: _refreshToken);
    await secureStorage.delete(key: _temporaryToken);
  }

  @override
  Future<void> close() => _controller.close();

  @override
  Stream<TokenPair?> getTokenPairStream() => _controller.stream;

  @override
  Future<TokenPair?> loadTokenPair() async {
    final accessToken = await secureStorage.read(key: _accessToken);
    final refreshToken = await secureStorage.read(key: _refreshToken);

    if (accessToken != null && refreshToken != null) {
      return (accessToken: accessToken, refreshToken: refreshToken);
    }
    return null;
  }

  @override
  Future<String?> loadTemporaryToken() async {
    final temporaryToken = await secureStorage.read(key: _temporaryToken);

    return temporaryToken;
  }

  @override
  Future<void> saveTokenPair(TokenPair tokenPair) async {
    await secureStorage.write(key: _accessToken, value: tokenPair.accessToken);
    await secureStorage.write(
        key: _refreshToken, value: tokenPair.refreshToken);
    _controller.add(tokenPair);
  }

  @override
  Future<void> saveTemporaryToken(String token) async {
    await secureStorage.write(key: _temporaryToken, value: token);
  }

  @override
  Future<String?> get accessToken => secureStorage.read(key: _accessToken);

  @override
  Future<String?> get refreshToken => secureStorage.read(key: _refreshToken);

  @override
  Future<String?> get temporaryToken =>
      secureStorage.read(key: _temporaryToken);
}
