import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cart/screen/cart_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../order_history/screen/order_history_screen.dart';
import '../../profile/screen/profile_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    OrderHistoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.all(10.r),
        child: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          destinations: [

            NavigationDestination(
              icon: AnimatedScale(
                scale: 1.0,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  Icons.home_outlined,
                  size: 25.sp,
                ),
              ),
              selectedIcon: AnimatedScale(
                scale: 1.8,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  Icons.home,
                  size: 25.sp,
                ),
              ),
              label: 'Home',
            ),


            NavigationDestination(
              icon: AnimatedScale(
                scale: 1.0,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  Icons.history_outlined,
                  size: 25.sp,
                ),
              ),
              selectedIcon: AnimatedScale(
                scale: 1.6,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  Icons.history,
                  size: 25.sp,
                ),
              ),
              label: 'Orders',
            ),

            NavigationDestination(
              icon: AnimatedScale(
                scale: 1.0,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 25.sp,
                ),
              ),
              selectedIcon: AnimatedScale(
                scale: 1.6,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  Icons.shopping_cart,
                  size: 25.sp,
                ),
              ),
              label: 'Cart',
            ),

            NavigationDestination(
              icon: AnimatedScale(
                scale: 1.0,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  Icons.person_outline,
                  size: 25.sp,
                ),
              ),
              selectedIcon: AnimatedScale(
                scale: 1.6,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  Icons.person,
                  size: 25.sp,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}