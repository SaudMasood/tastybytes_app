import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../categories/screen/categories_screen.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fade;
  late Animation<Offset> slide;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    fade = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(controller);

    slide = Tween(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(controller);

    controller.forward();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),

      child: Scaffold(
        backgroundColor: AppColors.lightGrey,

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Container(
            padding: EdgeInsets.all(15.w),
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
                  const CircleAvatar(
                    backgroundColor: AppColors.white,
                    child: Icon(
                      Icons.restaurant,
                      color: AppColors.black,
                    ),
                  ),

                  SizedBox(width: 10.w),

                  Text(
                    'TastyBytes 😋',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),

                  const Spacer(),

                  const CircleAvatar(
                    backgroundColor: AppColors.white,
                    child: Icon(
                      Icons.notifications_none,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final bloc = context.read<HomeBloc>();

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: AppColors.grey,
                    ),
                  ),

                  SizedBox(height: 15.h),


                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search your favorite food...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  FadeTransition(
                    opacity: fade,
                    child: SlideTransition(
                      position: slide,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(18.w),
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '20% OFF\nOn your first order 🎉',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.fastfood,
                              color: AppColors.yellow,
                              size: 50.sp,
                            ),
                          ],
                        ),
                      ),
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

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                              const CategoriesScreen(),
                            ),
                          );
                        },
                        child: Hero(
                          tag: "Category",
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
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bloc.categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.read<HomeBloc>().add(
                              SelectCategoryEvent(index),
                            );
                          },
                          child: Container(
                            width: 70.w,
                            margin: EdgeInsets.only(right: 10.w),
                            decoration: BoxDecoration(
                              color: state.selectedCategory == index
                                  ? AppColors.yellow
                                  : AppColors.white,
                              borderRadius:
                              BorderRadius.circular(15.r),
                            ),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Icon(
                                  bloc.icons[index],
                                  color:
                                  state.selectedCategory == index
                                      ? AppColors.black
                                      : AppColors.grey,
                                ),

                                SizedBox(height: 5.h),

                                Text(
                                  bloc.categories[index],
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
                    ),
                  ),

                  SizedBox(height: 25.h),

                  Text(
                    'Popular Food',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  SizedBox(
                    height: 210.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bloc.foods.length,
                      itemBuilder: (context, index) {
                        final food = bloc.foods[index];

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
                                      BorderRadius.circular(8.r),
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}