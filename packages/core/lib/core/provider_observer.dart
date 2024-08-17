import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';


class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    log('${container.hashCode} => ${provider.hashCode} => ${provider.name ?? provider.runtimeType}');
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    log('dispose: ${container.hashCode} => ${provider.name ?? provider.runtimeType}');
    super.didDisposeProvider(provider, container);
  }
}
