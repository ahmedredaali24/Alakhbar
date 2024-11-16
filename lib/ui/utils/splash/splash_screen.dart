import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../home/home_screen/home_screen.dart';
import '../mythemes.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashView";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   Future.delayed(const Duration(milliseconds: 2), () {
  //     Navigator.of(context)
  //         .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
  //   });
  //   super.initState();
  // }

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
              width: 300.w,
            ),

            GradientText("Alakhbar",
                style: TextStyle(
                  letterSpacing: -.5,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                ),
                colors: [
                  MyTheme.myTheme.colorScheme.primary,
                  MyTheme.myTheme.colorScheme.secondary,
                  MyTheme.myTheme.colorScheme.tertiary,
                ]),

            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            //description about app
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 33.w),
              child: Text(
                'Introducing Alakhbar 📰: Your go-to app for breaking news and in-depth analyses tailored to your interests! Stay informed effortlessly with personalized updates, bookmark articles, and engage with a vibrant community. 💡📱',
                textAlign: TextAlign.center,
                style: MyTheme.myTheme.textTheme.displaySmall,
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.15),

            LoadingAnimationWidget.waveDots(
                color: MyTheme.myTheme.colorScheme.secondary, size: 40.sp)
          ],
        ),
      ),
    );
  }
}
