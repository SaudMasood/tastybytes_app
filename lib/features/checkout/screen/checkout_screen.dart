import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
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
              child: Padding(
                padding: EdgeInsets.all(15.w),

                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: AppColors.white,
                      child: Icon(
                        Icons.shopping_cart_checkout,
                        color: AppColors.black,
                      ),
                    ),

                    SizedBox(width: 10.w),

                    Text(
                      'Checkout 🛍️',
                      style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        body: BlocConsumer<CheckoutBloc, CheckoutState>(
          listener: (context, state) {
            if (state is OrderPlaced) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                  const OrderSuccessScreen(),
                ),
              );
            }
          },

          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(18.w),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

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
                      prefixIcon:
                      const Icon(Icons.location_on),
                      filled: true,
                      fillColor: AppColors.white,

                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(15.r),
                        borderSide: BorderSide.none,
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

                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                      BorderRadius.circular(15.r),
                    ),

                    child: RadioListTile(
                      value: 'Cash on Delivery',
                      groupValue: state.paymentMethod,
                      title: const Text(
                        'Cash on Delivery',
                      ),
                      secondary:
                      const Icon(Icons.money),

                      onChanged: (value) {
                        context.read<CheckoutBloc>().add(
                          SelectPaymentMethod(
                            value.toString(),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                      BorderRadius.circular(15.r),
                    ),

                    child: RadioListTile(
                      value: 'Credit / Debit Card',
                      groupValue: state.paymentMethod,
                      title: const Text(
                        'Credit / Debit Card',
                      ),
                      secondary:
                      const Icon(Icons.credit_card),

                      onChanged: (value) {
                        context.read<CheckoutBloc>().add(
                          SelectPaymentMethod(
                            value.toString(),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                      BorderRadius.circular(15.r),
                    ),

                    child: RadioListTile(
                      value: 'EasyPaisa',
                      groupValue: state.paymentMethod,
                      title: const Text('EasyPaisa'),
                      secondary: const Icon(
                        Icons.account_balance_wallet,
                      ),

                      onChanged: (value) {
                        context.read<CheckoutBloc>().add(
                          SelectPaymentMethod(
                            value.toString(),
                          ),
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

                  SizedBox(height: 10.h),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),

                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                      BorderRadius.circular(15.r),
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

                        SizedBox(height: 12.h),

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
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),

                            Text(
                              '\$${(total + 2).toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25.h),

                  SizedBox(
                    width: double.infinity,
                    height: 52.h,

                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CheckoutBloc>().add(
                          PlaceOrder(),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        AppColors.yellow,
                        foregroundColor:
                        AppColors.black,

                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(15.r),
                        ),
                      ),

                      child: Text(
                        'Place Order',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
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