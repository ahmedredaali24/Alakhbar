import 'package:alakhbar/ui/home/home_screen/home_screen.dart';
import 'package:alakhbar/ui/home/tabs/home_view_tab/home_view.dart';
import 'package:alakhbar/ui/utils/bloc_observable.dart';
import 'package:alakhbar/ui/utils/splash/splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeView.routeName: (context) => HomeView()
      },
    );
  }
}
