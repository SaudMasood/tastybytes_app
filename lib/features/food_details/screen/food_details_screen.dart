import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../cart/bloc/cart_bloc.dart';
import '../../cart/bloc/cart_event.dart';
import '../../cart/bloc/cart_state.dart';
import '../../cart/screen/cart_screen.dart';
import '../bloc/food_details_bloc.dart';
import '../bloc/food_details_event.dart';

class FoodDetailsScreen extends StatefulWidget {
  final String category;
  final List<Map<String, Object>> foods;

  const FoodDetailsScreen({
    super.key,
    required this.category,
    required this.foods,
  });

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animationController);

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FoodDetailsBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              elevation: 0,
              centerTitle: false,
              titleSpacing: 16.w,
              title: Row(
                children: [
                  Container(
                    width: 42.w,
                    height: 42.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.restaurant_menu,
                      color: Colors.amber.shade800,
                      size: 23.sp,
                    ),
                  ),

                  SizedBox(width: 10.w),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delicious Choices',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        '${widget.category} Foods 🍕',
                        style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            body: Column(
              children: [
                SizedBox(height: 20.h),

                Hero(
                  tag: 'category${_getCategoryIndex()}',
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: double.infinity,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Center(
                        child: Text(
                          widget.category,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                Text(
                  '${widget.category} Foods',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10.h),

                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16.w),
                    itemCount: widget.foods.length,
                    itemBuilder: (context, index) {
                      final food = widget.foods[index];

                      final name = food['name'] as String;
                      final price = food['price'] as String;
                      final icon = food['icon'] as IconData;

                      return FadeTransition(
                        opacity: fadeAnimation,

                        child: Container(
                          margin: EdgeInsets.only(bottom: 15.h),
                          padding: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15.r),
                          ),

                          child: Row(
                            children: [
                              Hero(
                                tag: name,
                                child: Container(
                                  width: 80.w,
                                  height: 80.h,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius:
                                    BorderRadius.circular(12.r),
                                  ),
                                  child: Icon(
                                    icon,
                                    size: 45.sp,
                                  ),
                                ),
                              ),

                              SizedBox(width: 50.w),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(height: 5.h),

                                    Text(
                                      price,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber.shade800,
                                      ),
                                    ),

                                    SizedBox(height: 10.h),
                                    SizedBox(
                                      height: 38.h,
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          context.read<FoodDetailsBloc>().add(AddToCart());

                                          context.read<CartBloc>().add(
                                            AddCartItem({
                                              'name': name,
                                              'price': price,
                                              'icon': icon,
                                              'quantity': 1,
                                            }),
                                          );

                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('$name added to cart'),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 17.sp,
                                        ),
                                        label: Text(
                                          'Add to Cart',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                                          backgroundColor: AppColors.yellow,
                                          foregroundColor: AppColors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.r),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            floatingActionButton:
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                  child: Badge(
                    label: Text('${state.items.length}'),
                    child: const Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  int _getCategoryIndex() {
    if (widget.category == 'Pizza') return 0;
    if (widget.category == 'Burger') return 1;
    if (widget.category == 'Chicken') return 2;
    return 3;
  }
}