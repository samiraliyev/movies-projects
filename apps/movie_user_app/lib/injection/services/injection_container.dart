import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../routing/app_router.dart';

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter(
      // analytics: ref.watch(firebaseAnalyticsProvider),
      );
});
