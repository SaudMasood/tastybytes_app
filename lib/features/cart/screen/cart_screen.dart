import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../checkout/screen/checkout_screen.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'My Cart 🛒',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
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
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15.r),
                      ),

                      child: Row(
                        children: [
                          Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius:
                              BorderRadius.circular(12.r),
                            ),
                            child: Icon(
                              icon,
                              size: 30.sp,
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
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(price),
                              ],
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              context.read<CartBloc>().add(
                                DecreaseCartQuantity(index),
                              );
                            },
                            icon: const Icon(Icons.remove),
                          ),

                          Text('$quantity'),

                          IconButton(
                            onPressed: () {
                              context.read<CartBloc>().add(
                                IncreaseCartQuantity(index),
                              );
                            },
                            icon: const Icon(Icons.add),
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
                            builder: (context) =>
                                CheckoutScreen(
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
                          height: 55.h,

                          decoration: BoxDecoration(
                            color: state.isPressed
                                ? Colors.green
                                : Colors.amber,
                            borderRadius:
                            BorderRadius.circular(15.r),
                          ),

                          child: Center(
                            child: AnimatedSwitcher(
                              duration:
                              const Duration(milliseconds: 300),

                              child: state.isPressed
                                  ? const Text(
                                'Continue...',
                                key: ValueKey('continue'),
                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                  fontSize: 17,
                                ),
                              )
                                  : const Text(
                                'Checkout',
                                key: ValueKey('checkout'),
                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                  fontSize: 18,
                                ),
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