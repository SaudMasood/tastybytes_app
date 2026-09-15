import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/features/mainscreen/screen/mainscreen.dart';

import '../../home/screen/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();

  int page = 0;

  final images = [
    'assets/onboarding/food.png',
    'assets/onboarding/delivery.png',
    'assets/onboarding/enjoy.png',
  ];

  final titles = [
    'Delicious Food',
    'Fast Delivery',
    'Enjoy Your Meal',
  ];

  final descriptions = [
    'Order delicious food easily.',
    'Get your food delivered quickly.',
    'Enjoy your favorite meal.',
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: images.length,
                onPageChanged: (index) {
                  setState(() {
                    page = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          images[index],
                          width: 280.w,
                          height: 280.h,
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          titles[index],
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          descriptions[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  width: page == index ? 25.w : 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: page == index ? Colors.amber : Colors.grey,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),

            SizedBox(height: 25.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (page < images.length - 1) {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                    else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    }



                  },
              child: Text(
                    page == images.length - 1 ? 'Get Started' : 'Next',
                  ),
                ),
              ),
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}