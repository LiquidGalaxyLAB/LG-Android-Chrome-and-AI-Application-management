import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:laser_slides/models/boxes.dart';
import 'package:laser_slides/models/slide.dart';
import 'package:laser_slides/views/on_boarding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SlideAdapter());
  boxSLides = await Hive.openBox<Slide>('boxSLides');
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: 'assets/icons/appIcon.jpg',
        nextScreen: const OnBoarding(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 1000,
        splashIconSize: 200,
        curve: Curves.easeOut,
      )
    );
  }
}
