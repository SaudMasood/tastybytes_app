import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../categories/screen/categories_screen.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const categories = [
    'All',
    'Pizza',
    'Burger',
    'Pasta',
    'Drinks',
  ];

  static const icons = [
    Icons.apps,
    Icons.local_pizza,
    Icons.lunch_dining,
    Icons.ramen_dining,
    Icons.local_drink,
  ];

  static const foods = [
    {
      'name': 'Cheese Burger',
      'price': '\$12.99',
      'image': 'assets/food/burger.png',
    },
    {
      'name': 'Chicken Burger',
      'price': '\$11.99',
      'image': 'assets/food/burger.png',
    },
    {
      'name': 'Italian Pizza',
      'price': '\$15.99',
      'image': 'assets/food/pizza.png',
    },
    {
      'name': 'Cheese Pizza',
      'price': '\$13.99',
      'image': 'assets/food/pizza.png',
    },
    {
      'name': 'Creamy Pasta',
      'price': '\$10.99',
      'image': 'assets/food/pasta.png',
    },
    {
      'name': 'Fresh Juice',
      'price': '\$5.99',
      'image': 'assets/food/drink.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),

      child: Scaffold(
        backgroundColor: Colors.grey.shade50,

        appBar: AppBar(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
          elevation: 0,
          titleSpacing: 16.w,

          title: Row(
            children: [
              Container(
                width: 44.w,
                height: 44.h,

                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),

                child: Icon(
                  Icons.restaurant,
                  color: Colors.amber.shade800,
                  size: 25.sp,
                ),
              ),

              SizedBox(width: 10.w),

              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  Text(
                    'Welcome Back 👋',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black54,
                    ),
                  ),

                  Text(
                    'TastyBytes 😋',
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          actions: [
            Container(
              margin: EdgeInsets.only(right: 12.w),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
              ),

              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none,
                  size: 25.sp,
                ),
              ),
            ),
          ],
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [
              Text(
                'What are you craving?',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 5.h),

              Text(
                'Find something delicious for you',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 15.h),

              Container(
                height: 55.h,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(18.r),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),

                child: TextField(
                  decoration: InputDecoration(
                    hintText:
                    'Search your favorite food...',

                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.amber.shade800,
                    ),

                    suffixIcon: Container(
                      margin: EdgeInsets.all(7.w),

                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius:
                        BorderRadius.circular(12.r),
                      ),

                      child: const Icon(Icons.tune),
                    ),

                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),

                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                  BorderRadius.circular(22.r),
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
                              color: Colors.amber,
                              fontSize: 11.sp,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 10.h),

                          Text(
                            '20% OFF',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27.sp,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                          Text(
                            'On your first order',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Icon(
                      Icons.fastfood,
                      color: Colors.amber,
                      size: 60.sp,
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
                          fontSize: 14.sp,
                          fontWeight:
                          FontWeight.bold,
                          color:
                          Colors.amber.shade800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              SizedBox(
                height: 85.h,

                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    int selected = 0;

                    if (state is HomeCategoryChanged) {
                      selected =
                          state.selectedCategory;
                    }

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,

                      itemBuilder:
                          (context, index) {
                        final isSelected =
                            selected == index;

                        return GestureDetector(
                          onTap: () {
                            context
                                .read<HomeBloc>()
                                .add(
                              SelectCategoryEvent(
                                index,
                              ),
                            );
                          },

                          child: AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 250,
                            ),

                            width: 72.w,

                            margin: EdgeInsets.only(
                              right: 10.w,
                            ),

                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.amber
                                  : Colors.white,

                              borderRadius:
                              BorderRadius.circular(
                                18.r,
                              ),
                            ),

                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .center,

                              children: [
                                Icon(
                                  icons[index],
                                  size: 25.sp,

                                  color: isSelected
                                      ? Colors.black
                                      : Colors.grey,
                                ),

                                SizedBox(height: 5.h),

                                Text(
                                  categories[index],
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight:
                                    FontWeight.bold,
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
                      fontWeight: FontWeight.bold,
                      color: Colors.amber.shade800,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              SizedBox(
                height: 220.h,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foods.length,

                  itemBuilder: (context, index) {
                    final food = foods[index];

                    return Container(
                      width: 170.w,

                      margin: EdgeInsets.only(
                        right: 14.w,
                      ),

                      padding: EdgeInsets.all(10.w),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                        BorderRadius.circular(20.r),

                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color:
                            Colors.grey.shade300,
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.circular(
                                15.r,
                              ),

                              child: Image.asset(
                                food['image']!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          SizedBox(height: 8.h),

                          Text(
                            food['name']!,
                            maxLines: 1,
                            overflow:
                            TextOverflow.ellipsis,

                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 5.h),

                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,

                            children: [
                              Text(
                                food['price']!,
                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                  color: Colors
                                      .amber.shade800,
                                ),
                              ),

                              Container(
                                padding:
                                EdgeInsets.all(6.w),

                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                    10.r,
                                  ),
                                ),

                                child: const Icon(
                                  Icons.add,
                                ),
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