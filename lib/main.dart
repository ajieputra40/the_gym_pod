import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'menu/loginPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  /// Prevent landscape mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MaterialApp(
      home: new MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Normal Logo Splash screen
    Widget splashScreenView = SplashScreenView(
      home: LoginPage(),
      duration: 2000,
      imageSize: 180,
      imageSrc: "assets/images/logo.png",
      backgroundColor: Colors.white,
    );

    return MaterialApp(
      home: splashScreenView,
    );
  }
}