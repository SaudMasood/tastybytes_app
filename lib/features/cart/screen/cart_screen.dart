import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../checkout/screen/checkout_screen.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
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
                Icons.shopping_cart,
                color: Colors.amber.shade800,
                size: 23.sp,
              ),
            ),

            SizedBox(width: 10.w),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Order',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'My Cart 🛒',
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
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(
              child: Text('Cart is empty'),
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
                      padding: EdgeInsets.all(15.w),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 65.w,
                            height: 65.h,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(
                              icon,
                              size: 35.sp,
                            ),
                          ),

                          SizedBox(width: 12.w),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  price,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              context.read<CartBloc>().add(
                                DecreaseCartQuantity(index),
                              );
                            },
                            icon: const Icon(
                              Icons.remove,
                            ),
                          ),

                          Text(
                            '$quantity',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              context.read<CartBloc>().add(
                                IncreaseCartQuantity(index),
                              );
                            },
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              context.read<CartBloc>().add(
                                RemoveCartItem(index),
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
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
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      offset: const Offset(0, -2),
                      color: Colors.grey.shade300,
                    ),
                  ],
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
                            color: Colors.amber.shade800,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12.h),

                    AnimatedScale(
                      scale: isPressed ? 0.92 : 1.0,
                      duration:
                      const Duration(milliseconds: 120),
                      curve: Curves.easeOut,

                      child: AnimatedContainer(
                        duration:
                        const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,

                        width: double.infinity,
                        height: isPressed ? 50.h : 55.h,

                        decoration: BoxDecoration(
                          color: isPressed
                              ? Colors.amber.shade700
                              : Colors.amber,

                          borderRadius: BorderRadius.circular(
                            isPressed ? 18.r : 12.r,
                          ),

                          boxShadow: [
                            BoxShadow(
                              blurRadius: isPressed ? 3 : 10,
                              offset: Offset(
                                0,
                                isPressed ? 2 : 5,
                              ),
                              color: Colors.grey.shade400,
                            ),
                          ],
                        ),

                        child: GestureDetector(
                          onTapDown: (_) {
                            setState(() {
                              isPressed = true;
                            });
                          },

                          onTapUp: (_) {
                            setState(() {
                              isPressed = false;
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CheckoutScreen(
                                      total: total,
                                    ),
                              ),
                            );
                          },

                          onTapCancel: () {
                            setState(() {
                              isPressed = false;
                            });
                          },

                          child: Center(
                            child: AnimatedSwitcher(
                              duration:
                              const Duration(milliseconds: 200),

                              transitionBuilder:
                                  (child, animation) {
                                return ScaleTransition(
                                  scale: animation,
                                  child: FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                                );
                              },

                              child: isPressed
                                  ? Row(
                                key: const ValueKey(
                                  'pressed',
                                ),
                                mainAxisSize:
                                MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 22.sp,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'Continue',
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                                  : Row(
                                key: const ValueKey(
                                  'normal',
                                ),
                                mainAxisSize:
                                MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons
                                        .shopping_cart_checkout,
                                    size: 22.sp,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'Checkout',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),
                                ],
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