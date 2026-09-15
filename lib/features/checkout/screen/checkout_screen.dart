import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../order_success/screen/order_success_screen.dart';
import '../bloc/checkout_bloc.dart';
import '../bloc/checkout_event.dart';
import '../bloc/checkout_state.dart';

class CheckoutScreen extends StatelessWidget {
  final double total;

  const CheckoutScreen({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CheckoutBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
          elevation: 0,
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
                  Icons.shopping_cart_checkout,
                  color: Colors.amber.shade800,
                  size: 23.sp,
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Almost Done',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    'Checkout 🛍️',
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

        body: BlocConsumer<CheckoutBloc, CheckoutState>(
          listener: (context, state) {
            if (state is OrderPlaced) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderSuccessScreen(),
                ),
              );
            }
          },

          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Delivery Address',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  TextField(
                    onChanged: (value) {
                      context.read<CheckoutBloc>().add(
                        ChangeAddress(value),
                      );
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your address',
                      prefixIcon: const Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),

                  SizedBox(height: 25.h),

                  Text(
                    'Payment Method',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Card(
                    child: RadioListTile<String>(
                      value: 'Cash on Delivery',
                      groupValue: state.paymentMethod,
                      secondary: const Icon(Icons.money),
                      title: const Text('Cash on Delivery'),
                      onChanged: (value) {
                        context.read<CheckoutBloc>().add(
                          SelectPaymentMethod(value!),
                        );
                      },
                    ),
                  ),

                  Card(
                    child: RadioListTile<String>(
                      value: 'Credit / Debit Card',
                      groupValue: state.paymentMethod,
                      secondary: const Icon(Icons.credit_card),
                      title: const Text('Credit / Debit Card'),
                      onChanged: (value) {
                        context.read<CheckoutBloc>().add(
                          SelectPaymentMethod(value!),
                        );
                      },
                    ),
                  ),

                  Card(
                    child: RadioListTile<String>(
                      value: 'EasyPaisa',
                      groupValue: state.paymentMethod,
                      secondary: const Icon(
                        Icons.account_balance_wallet,
                      ),
                      title: const Text('EasyPaisa'),
                      onChanged: (value) {
                        context.read<CheckoutBloc>().add(
                          SelectPaymentMethod(value!),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 25.h),

                  Text(
                    'Order Summary',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 15.h),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Subtotal'),
                            Text(
                              '\$${total.toStringAsFixed(2)}',
                            ),
                          ],
                        ),

                        SizedBox(height: 10.h),

                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Delivery'),
                            Text('\$2.00'),
                          ],
                        ),

                        const Divider(),

                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${(total + 2).toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),

                  SizedBox(
                    width: double.infinity,
                    height: 55.h,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CheckoutBloc>().add(
                          PlaceOrder(),
                        );
                      },
                      child: const Text(
                        'Place Order',
                      ),
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