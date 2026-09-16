import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../food_details/screen/food_details_screen.dart';
import '../bloc/categories_bloc.dart';
import '../bloc/categories_event.dart';
import '../bloc/categories_state.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoriesBloc()..add(LoadCategories()),

      child: Scaffold(
        backgroundColor: AppColors.lightGrey,

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
                      Icons.category,
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
                        'Explore Food',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.darkGrey,
                        ),
                      ),

                      SizedBox(height: 2.h),

                      Text(
                        'Categories 🍕',
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

        body: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesInitial) {
              return const SizedBox();
            }

            if (state is CategoriesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is CategoriesLoaded) {
              return Padding(
                padding: EdgeInsets.all(16.w),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'Choose Category',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),

                    SizedBox(height: 5.h),

                    Text(
                      'Select your favorite food',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 13.sp,
                      ),
                    ),

                    SizedBox(height: 20.h),

                    Expanded(
                      child: ListView.builder(
                        itemCount: state.categories.length,

                        itemBuilder: (context, index) {
                          final category =
                          state.categories[index];

                          return GestureDetector(
                            onTap: () {
                              final name =
                              category['name'] as String;

                              context
                                  .read<CategoriesBloc>()
                                  .add(SelectCategory(index));

                              final categoryFoods = context
                                  .read<CategoriesBloc>()
                                  .foods
                                  .where(
                                    (food) =>
                                food['category'] == name,
                              )
                                  .toList();

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      FoodDetailsScreen(
                                        category: name,
                                        foods: categoryFoods,
                                      ),
                                ),
                              );
                            },

                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                bottom: 12.h,
                              ),
                              padding: EdgeInsets.all(14.w),

                              decoration: BoxDecoration(
                                color: state.selectedIndex == index
                                    ? AppColors.yellow
                                    : AppColors.white,

                                borderRadius:
                                BorderRadius.circular(16.r),
                              ),

                              child: Row(
                                children: [
                                  Container(
                                    width: 55.w,
                                    height: 55.h,

                                    decoration: BoxDecoration(
                                      color: AppColors.yellow,
                                      borderRadius:
                                      BorderRadius.circular(13.r),
                                    ),

                                    child: Icon(
                                      category['icon'] as IconData,
                                      color: AppColors.black,
                                      size: 28.sp,
                                    ),
                                  ),

                                  SizedBox(width: 15.w),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          category['name'] as String,
                                          style: TextStyle(
                                            fontSize: 17.sp,
                                            fontWeight:
                                            FontWeight.bold,
                                            color: AppColors.black,
                                          ),
                                        ),

                                        SizedBox(height: 4.h),

                                        Text(
                                          'View delicious food',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: AppColors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16.sp,
                                    color: AppColors.grey,
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
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}