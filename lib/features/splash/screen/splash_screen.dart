import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'package:resturant_app/features/onboarding/screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 6),
          () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnboardingScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [

          Positioned(
            top: -25.h,
            right: -25.w,
            child: Container(
              width: 80.w,
              height: 80.h,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            top: 25.h,
            right: 25.w,
            child: Container(
              width: 25.w,
              height: 25.h,
              decoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: -25.h,
            left: -25.w,
            child: Container(
              width: 80.w,
              height: 80.h,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: 25.h,
            left: 25.w,
            child: Container(
              width: 25.w,
              height: 25.h,
              decoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [

                SizedBox(height: 45.h),

                Container(
                  width: 100.w,
                  height: 100.h,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo/logo.png',

                       fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: 15.h),

                Text(
                  'TastyBytes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 5.h),

                Text(
                  'GOOD FOOD • GOOD MOOD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber.shade800,
                    letterSpacing: 2,
                  ),
                ),

                SizedBox(height: 10.h),

                Text(
                  'Your favorite food, delivered fresh.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                ),

                Expanded(
                  child: Lottie.asset(
                    'assets/animation/Bike.json',
                    width: 350.w,
                    height: 1000.h,
                    repeat: true,
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 13.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delivery_dining,
                        color: Colors.amber,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Fresh • Fast • Delicious',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 22.h),

                SizedBox(
                  width: 230.w,
                  child: LinearProgressIndicator(
                    minHeight: 5.h,
                    borderRadius: BorderRadius.circular(10.r),
                    backgroundColor: Colors.grey.shade200,
                    color: Colors.amber,
                  ),
                ),

                SizedBox(height: 10.h),

                Text(
                  'Preparing your experience...',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.grey.shade500,
                  ),
                ),

                SizedBox(height: 30.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}