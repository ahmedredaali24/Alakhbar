import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../home/tabs/home_view_tab/home_view.dart';
import '../mythemes.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashView";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeView.routeName, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image asset
            Image.asset(
              'assets/main/main.jpg',
              width: 340,
            ),

            GradientText("Alakhbar",
                style: const TextStyle(
                  letterSpacing: -.5,
                  fontSize: 38,
                  fontWeight: FontWeight.w600,
                ),
                colors: [
                  MyTheme.myTheme.colorScheme.primary,
                  MyTheme.myTheme.colorScheme.secondary,
                  MyTheme.myTheme.colorScheme.tertiary,
                ]),

            const SizedBox(height: 20),

            //description about app
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Introducing Alakhbar 📰: Your go-to app for breaking news and in-depth analyses tailored to your interests! Stay informed effortlessly with personalized updates, bookmark articles, and engage with a vibrant community. 💡📱',
                textAlign: TextAlign.center,
                style: MyTheme.myTheme.textTheme.displaySmall,
              ),
            ),

            const SizedBox(height: 100),

            LoadingAnimationWidget.waveDots(
                color: MyTheme.myTheme.colorScheme.secondary, size: 40)
          ],
        ),
      ),
    );
  }
}
