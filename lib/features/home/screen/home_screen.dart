import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../categories/screen/categories_screen.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final categories = const [
    'All',
    'Pizza',
    'Burger',
    'Pasta',
    'Drinks',
  ];

  final icons = const [
    Icons.apps,
    Icons.local_pizza,
    Icons.lunch_dining,
    Icons.ramen_dining,
    Icons.local_drink,
  ];

  final foods = const [
    {
      'name': 'Cheese Burger',
      'price': '\$12.99',
      'image': 'assets/food/burger.png',
    },
    {
      'name': 'Italian Pizza',
      'price': '\$15.99',
      'image': 'assets/food/pizza.png',
    },
    {
      'name': 'Creamy Pasta',
      'price': '\$10.99',
      'image': 'assets/food/pasta.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),

      child: Scaffold(
        backgroundColor: AppColors.lightGrey,

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.h),

          child: Container(
            decoration: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35.r),
                bottomRight: Radius.circular(35.r),
              ),
            ),

            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),

                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 21.r,
                      backgroundColor: AppColors.white,
                      child: Icon(
                        Icons.restaurant,
                        color: AppColors.black,
                        size: 23.sp,
                      ),
                    ),

                    SizedBox(width: 10.w),

                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back 👋',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColors.darkGrey,
                          ),
                        ),

                        Text(
                          'TastyBytes 😋',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    Container(
                      width: 42.w,
                      height: 42.h,

                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),

                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_none,
                          color: AppColors.black,
                          size: 23.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'What are you craving?',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),

              SizedBox(height: 5.h),

              Text(
                'Find something delicious for you',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.grey,
                ),
              ),

              SizedBox(height: 15.h),

              TextField(
                decoration: InputDecoration(
                  hintText: 'Search your favorite food...',
                  prefixIcon: const Icon(Icons.search),

                  suffixIcon: Container(
                    margin: EdgeInsets.all(7.w),
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius:
                      BorderRadius.circular(10.r),
                    ),
                    child: const Icon(Icons.tune),
                  ),

                  filled: true,
                  fillColor: AppColors.white,

                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(16.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18.w),

                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius:
                  BorderRadius.circular(20.r),
                ),

                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SPECIAL OFFER',
                            style: TextStyle(
                              color: AppColors.yellow,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 7.h),

                          Text(
                            '20% OFF',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 27.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            'On your first order',
                            style: TextStyle(
                              color: AppColors.white.withOpacity(.7),
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Icon(
                      Icons.fastfood,
                      color: AppColors.yellow,
                      size: 55.sp,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25.h),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Hero(
                    tag: 'categories',
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                            const CategoriesScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: AppColors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              SizedBox(
                height: 80.h,

                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    int selected = 0;

                    if (state is HomeCategoryChanged) {
                      selected = state.selectedCategory;
                    }

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,

                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.read<HomeBloc>().add(
                              SelectCategoryEvent(index),
                            );
                          },

                          child: Container(
                            width: 70.w,
                            margin: EdgeInsets.only(
                              right: 10.w,
                            ),

                            decoration: BoxDecoration(
                              color: selected == index
                                  ? AppColors.yellow
                                  : AppColors.white,
                              borderRadius:
                              BorderRadius.circular(16.r),
                            ),

                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Icon(
                                  icons[index],
                                  color: selected == index
                                      ? AppColors.black
                                      : AppColors.grey,
                                ),

                                SizedBox(height: 5.h),

                                Text(
                                  categories[index],
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 25.h),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Food',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'View All',
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              SizedBox(
                height: 215.h,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foods.length,

                  itemBuilder: (context, index) {
                    final food = foods[index];

                    return Container(
                      width: 170.w,
                      margin: EdgeInsets.only(right: 12.w),
                      padding: EdgeInsets.all(10.w),

                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                        BorderRadius.circular(18.r),
                      ),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [

                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.circular(14.r),
                              child: Image.asset(
                                food['image']!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          SizedBox(height: 7.h),

                          Text(
                            food['name']!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),

                          SizedBox(height: 5.h),

                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [

                              Text(
                                food['price']!,
                                style: TextStyle(
                                  color: AppColors.yellow,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.all(5.w),
                                decoration: BoxDecoration(
                                  color: AppColors.yellow,
                                  borderRadius:
                                  BorderRadius.circular(9.r),
                                ),
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}