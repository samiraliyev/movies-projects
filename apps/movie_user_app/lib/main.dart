import 'package:core/core/provider_observer.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final appProtectionService = InAppProtectionService();
  // await appProtectionService.init();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );



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

  await ServiceLocator.init(sharedPreferences: sharedPreferences);
  await AppStartupWrapper.initialize(container);
}