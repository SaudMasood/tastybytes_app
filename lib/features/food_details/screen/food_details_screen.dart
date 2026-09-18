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

  String? addedFood;

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
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(85.h),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  ),
                ),
                child: SafeArea(
                  child: Row(
                    children: [
                      SizedBox(width: 8.w),

                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.black,
                          size: 22.sp,
                        ),
                      ),

                      SizedBox(width: 4.w),

                      CircleAvatar(
                        radius: 22.r,
                        backgroundColor: AppColors.white,
                        child: Icon(
                          Icons.restaurant_menu,
                          color: AppColors.black,
                          size: 22.sp,
                        ),
                      ),

                      SizedBox(width: 12.w),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delicious Choices',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: AppColors.darkGrey,
                            ),
                          ),

                          SizedBox(height: 2.h),

                          Text(
                            '${widget.category} Foods 🍕',
                            style: TextStyle(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'Details_${widget.category}',
                          child: Icon(
                            widget.category == 'Pizza'
                                ? Icons.local_pizza
                                : widget.category == 'Burger'
                                ? Icons.lunch_dining
                                : widget.category == 'Chicken'
                                ? Icons.restaurant
                                : Icons.local_drink,
                            size: 40.sp,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          widget.category,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
                      final isAdded = addedFood == name;

                      return FadeTransition(
                        opacity: fadeAnimation,
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: 15.h,
                          ),
                          padding: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 80.w,
                                height: 80.h,
                                decoration: BoxDecoration(
                                  color: AppColors.yellow,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Icon(
                                  icon,
                                  size: 45.sp,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(width: 20.w),
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
                                        color: AppColors.darkGrey,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 400,
                                      ),
                                      curve: Curves.easeOutBack,
                                      width: isAdded ? 120.w : 110.w,
                                      height: 38.h,
                                      decoration: BoxDecoration(
                                        color: isAdded
                                            ? AppColors.success
                                            : AppColors.yellow,
                                        borderRadius: BorderRadius.circular(
                                          isAdded ? 20.r : 10.r,
                                        ),
                                      ),
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            addedFood = name;
                                          });

                                          context
                                              .read<FoodDetailsBloc>()
                                              .add(AddToCart());

                                          context.read<CartBloc>().add(
                                            AddCartItem({
                                              'name': name,
                                              'price': price,
                                              'icon': icon,
                                              'quantity': 1,
                                            }),
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                '$name added to cart',
                                              ),
                                              duration:
                                              const Duration(seconds: 1),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          isAdded
                                              ? Icons.check
                                              : Icons.add,
                                          size: 17.sp,
                                        ),
                                        label: Text(
                                          isAdded
                                              ? 'Added'
                                              : 'Add to Cart',
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          foregroundColor: AppColors.black,
                                          elevation: 0,
                                          shadowColor: Colors.transparent,
                                          padding: EdgeInsets.zero,
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
            ),floatingActionButton: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return FloatingActionButton(
                heroTag: 'cart',

                backgroundColor: AppColors.yellow,
                foregroundColor: AppColors.black,

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },

                child: Badge(
                  label: Text(
                    '${state.items.length}',
                  ),
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
}