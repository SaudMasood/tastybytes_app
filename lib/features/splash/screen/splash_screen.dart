import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/features/onboarding/screen/onboarding_screen.dart';

import '../../home/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {

      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TastyBytes 😋",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Order Food And Enjoy Taste",
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 20.h),
            AnimatedContainer(
                  duration: Duration(seconds: 2),
              curve: Curves.easeInCirc,
              child: Image.asset(
                'assets/logo/logo.png',
                width: 180.w,
                height: 180.h,
              ),
            ),
            SizedBox(height: 30.h),
            SizedBox(
              width: 250.w,
              child: LinearProgressIndicator(
                minHeight: 8.h,

                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}