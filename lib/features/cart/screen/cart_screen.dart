import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../checkout/screen/checkout_screen.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.h),
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
                SizedBox(width: 14.w),



                CircleAvatar(
                  radius: 22.r,
                  backgroundColor: AppColors.white,
                  child: Icon(
                    Icons.shopping_cart,
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
                      'Your Items',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.darkGrey,
                      ),
                    ),

                    SizedBox(height: 2.h),

                    Text(
                      'My Cart 🛒',
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

      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return Center(
              child: Text(
                'Cart is empty 🛒',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
              ),
            );
          }

          double total = 0;

          for (final item in state.items) {
            final price = double.parse(
              (item['price'] as String).replaceAll('\$', ''),
            );

            final quantity = item['quantity'] as int;

            total += price * quantity;
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16.w),
                  itemCount: state.items.length,

                  itemBuilder: (context, index) {
                    final item = state.items[index];

                    final name = item['name'] as String;
                    final price = item['price'] as String;
                    final icon = item['icon'] as IconData;
                    final quantity = item['quantity'] as int;

                    return Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.all(12.w),

                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15.r),
                      ),

                      child: Row(
                        children: [
                          Container(
                            width: 60.w,
                            height: 60.h,

                            decoration: BoxDecoration(
                              color: AppColors.yellow,
                              borderRadius:
                              BorderRadius.circular(12.r),
                            ),

                            child: Icon(
                              icon,
                              size: 30.sp,
                              color: AppColors.black,
                            ),
                          ),

                          SizedBox(width: 10.w),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  maxLines: 1,

                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                  ),
                                ),

                                SizedBox(height: 4.h),

                                Text(
                                  price,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius:
                              BorderRadius.circular(10.r),
                            ),

                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context.read<CartBloc>().add(
                                      DecreaseCartQuantity(index),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    size: 17.sp,
                                  ),
                                ),

                                Text(
                                  '$quantity',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {
                                    context.read<CartBloc>().add(
                                      IncreaseCartQuantity(index),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 17.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Flexible(
                            child: IconButton(
                              onPressed: () {
                                context.read<CartBloc>().add(
                                  RemoveCartItem(index),
                                );
                              },
                              icon: Icon(
                                Icons.delete_outline,
                                color: AppColors.error,
                                size: 22.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.all(16.w),

                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                ),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          '\$${total.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12.h),

                    GestureDetector(
                      onTap: () async {
                        context.read<CartBloc>().add(
                          CheckoutPressed(),
                        );

                        await Future.delayed(
                          const Duration(seconds: 2),
                        );

                        if (!context.mounted) return;

                        context.read<CartBloc>().add(
                          CheckoutReset(),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CheckoutScreen(
                              total: total,
                            ),
                          ),
                        );
                      },

                      child: AnimatedScale(
                        scale: state.isPressed ? 0.92 : 1.0,
                        duration:
                        const Duration(milliseconds: 300),

                        child: AnimatedContainer(
                          duration:
                          const Duration(milliseconds: 300),
                          width: double.infinity,
                          height: 52.h,

                          decoration: BoxDecoration(
                            color: state.isPressed
                                ? AppColors.success
                                : AppColors.yellow,
                            borderRadius:
                            BorderRadius.circular(15.r),
                          ),

                          child: Center(
                            child: Text(
                              state.isPressed
                                  ? 'Continue...'
                                  : 'Checkout',
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}