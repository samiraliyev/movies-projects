import 'package:core/core/provider_observer.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/app/app_startup_wrapper.dart';
import 'firebase_options.dart';
import 'injection/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final appProtectionService = InAppProtectionService();
  // await appProtectionService.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  await FirebasePerformance.instance.setPerformanceCollectionEnabled(true);

  EquatableConfig.stringify = true;



  final sharedPreferences = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    observers: [Logger()],
    overrides: [
      // ...overrides,
      sharedPrefsProvider.overrideWithValue(sharedPreferences),
    ],
  );

  // await dotenv.load(fileName: Assets.files.credentialsEnv);
  // await ScreenProtectUtils.disableScreenCapture();
  // await ScreenProtectUtils.protectDataLeakage();

  await AppStartupWrapper.initialize(container);

}