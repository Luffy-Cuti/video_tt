import 'dart:async';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/services/kakoak_api_service.dart';
import 'core/services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupFirebaseCrashlytics();
  final notificationService = NotificationService();
  await notificationService.initialize();

  runApp(
    VideoApp(
      apiService: KakoakApiService(),
      notificationService: notificationService,
    ),
  );
}
Future<void> _setupFirebaseCrashlytics() async {
  try {
    await Firebase.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  } catch (_) {

  }
}