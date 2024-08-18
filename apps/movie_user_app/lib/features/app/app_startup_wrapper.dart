import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

import 'app.dart';

// import 'app.dart';

final initialLinkNotifier = ValueNotifier<String?>(null);

abstract class AppStartupWrapper {
  static Future<void> initialize(
    // List<Override> overrides,
    ProviderContainer container,
  ) async {
    EquatableConfig.stringify = true;

    /// enables [FirebaseCrashlytics] for application
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    /// enables portrait mode for application (disable landscape mode)
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    /// enables [FirebaseCrashlytics] for application
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
      true,
    );

    runApp(
      UncontrolledProviderScope(
        container: container,
        child:
            // DevicePreview(
            //   enabled: !kReleaseMode,
            //   builder: (context) =>
            const App(), // Wrap your app
        // ),
      ),
    );

    FlutterError.demangleStackTrace = (StackTrace stack) {
      if (stack is stack_trace.Trace) return stack.vmTrace;
      if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
      return stack;
    };
  }
}
