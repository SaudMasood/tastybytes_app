import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/order_history_bloc.dart';
import '../bloc/order_history_event.dart';
import '../bloc/order_history_state.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  int selectedOrder = -1;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    animation = Tween<double>(
      begin: 0.8,
      end: 1.0,
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
      create: (_) => OrderHistoryBloc()
        ..add(LoadOrdersEvent()),

      child: Scaffold(
        backgroundColor: Colors.grey.shade50,

        appBar: AppBar(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
          elevation: 0,

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
                  Icons.history,
                  color: Colors.amber.shade800,
                ),
              ),

              SizedBox(width: 10.w),

              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Orders',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black54,
                    ),
                  ),

                  Text(
                    'Order History 📋',
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

        body: BlocBuilder<OrderHistoryBloc, OrderHistoryState>(
          builder: (context, state) {
            if (state is OrderHistoryLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is OrderHistoryLoaded) {
              if (state.orders.isEmpty) {
                return const Center(
                  child: Text('No orders found'),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: state.orders.length,

                itemBuilder: (context, index) {
                  final order = state.orders[index];

                  final id = order['id'] as String;
                  final items = order['items'] as String;
                  final total = order['total'] as String;
                  final status = order['status'] as String;
                  final date = order['date'] as String;
                  final payment = order['payment'] as String;
                  final address = order['address'] as String;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOrder = index;
                      });

                      controller.reset();
                      controller.forward();
                    },

                    child: selectedOrder == index
                        ? ScaleTransition(
                      scale: animation,
                      child: _orderCard(
                        id,
                        items,
                        total,
                        status,
                        date,
                        payment,
                        address,
                      ),
                    )
                        : _orderCard(
                      id,
                      items,
                      total,
                      status,
                      date,
                      payment,
                      address,
                    ),
                  );
                },
              );
            }

            return const Center(
              child: Text('No orders found'),
            );
          },
        ),
      ),
    );
  }

  Widget _orderCard(
      String id,
      String items,
      String total,
      String status,
      String date,
      String payment,
      String address,
      ) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),

        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.grey.shade300,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Container(
                width: 55.w,
                height: 55.h,

                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(12.r),
                ),

                child: Icon(
                  Icons.receipt_long,
                  size: 30.sp,
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order $id',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 6.h,
                ),

                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20.r),
                ),

                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 15.h),

          const Divider(),

          SizedBox(height: 10.h),

          Text(
            'Order Details',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10.h),

          Row(
            children: [
              const Icon(
                Icons.restaurant,
                size: 20,
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: Text(items),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 20,
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: Text(address),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          Row(
            children: [
              const Icon(
                Icons.payment,
                size: 20,
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: Text(payment),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          const Divider(),

          SizedBox(height: 8.h),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                total,
                style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber.shade800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}