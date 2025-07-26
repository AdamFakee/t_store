import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';
import 'package:t_store/data/repositories/authentication_repository.dart';
import 'package:t_store/firebase_options.dart';

/// --Entry point of flutter app
Future<void> main() async {
  /// --Widget binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// --Init GetX localstorage
  await GetStorage.init();

  /// -- Await Splash screen util other items load
  /// 
  /// -- Purpose why using like that 
  /// 
  /// -- Texts below were written in lib 
  /// [https://pub.dev/packages/flutter_native_splash#3-set-up-app-initialization-optional]
  /// 
  /// By default, the splash screen will be removed when Flutter has drawn the first frame. If you would like the splash screen to remain while your app initializes, you can use the preserve() and remove() methods together. Pass the preserve() method the value returned from WidgetsFlutterBinding.ensureInitialized() to keep the splash on screen. Later, when your app has initialized, make a call to remove() to remove the splash screen.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  /// -- Initialize Firebase & Authentication Repository (using GetController)
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository())
  );


  runApp(const App());
}

