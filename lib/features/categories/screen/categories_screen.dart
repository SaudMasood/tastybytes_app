import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../food_details/screen/food_details_screen.dart';
import '../bloc/categories_bloc.dart';
import '../bloc/categories_event.dart';
import '../bloc/categories_state.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  final categories = [
    'Pizza',
    'Burger',
    'Chicken',
    'Drinks',
  ];

  final foods = [
    {
      'category': 'Pizza',
      'name': 'Cheese Pizza',
      'price': '\$12',
      'icon': Icons.local_pizza,
    },
    {
      'category': 'Pizza',
      'name': 'Pepperoni Pizza',
      'price': '\$15',
      'icon': Icons.local_pizza,
    },
    {
      'category': 'Burger',
      'name': 'Cheese Burger',
      'price': '\$10',
      'icon': Icons.lunch_dining,
    },
    {
      'category': 'Burger',
      'name': 'Chicken Burger',
      'price': '\$11',
      'icon': Icons.lunch_dining,
    },
    {
      'category': 'Chicken',
      'name': 'Fried Chicken',
      'price': '\$13',
      'icon': Icons.restaurant,
    },
    {
      'category': 'Chicken',
      'name': 'Grilled Chicken',
      'price': '\$16',
      'icon': Icons.restaurant,
    },
    {
      'category': 'Drinks',
      'name': 'Coca Cola',
      'price': '\$3',
      'icon': Icons.local_drink,
    },
    {
      'category': 'Drinks',
      'name': 'Fresh Juice',
      'price': '\$5',
      'icon': Icons.local_drink,
    },
  ];

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
      create: (_) => CategoriesBloc(),
      child: Scaffold(
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
                  Icons.category,
                  color: Colors.amber.shade800,
                  size: 23.sp,
                ),
              ),

              SizedBox(width: 10.w),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Food',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    'Categories 🍕',
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
        body: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            int selectedIndex = 0;

            if (state is CategorySelected) {
              selectedIndex = state.selectedIndex;
            }

            return Column(
              children: [
                SizedBox(height: 15.h),

                Hero(
                  tag: 'categories',
                  child: Container(
                    width: 150.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Center(
                      child: Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(16.w),
                    itemCount: categories.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      final category = categories[index];

                      return FadeTransition(
                        opacity: fadeAnimation,
                        child: GestureDetector(
                          onTap: () {
                            context.read<CategoriesBloc>().add(
                              SelectCategoryEvent(index),
                            );

                            final categoryFoods = foods
                                .where(
                                  (food) =>
                              food['category'] == category,
                            )
                                .toList();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return FoodDetailsScreen(
                                    category: category,
                                    foods: categoryFoods,
                                  );
                                },
                              ),
                            );
                          },
                          child: Hero(
                            tag: 'category$index',
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? Colors.amber
                                    : Colors.grey.shade200,
                                borderRadius:
                                BorderRadius.circular(15.r),
                              ),
                              child: Center(
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}