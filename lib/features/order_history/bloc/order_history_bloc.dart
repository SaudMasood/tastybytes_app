import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_history_event.dart';
import 'order_history_state.dart';

class OrderHistoryBloc
    extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  OrderHistoryBloc() : super(OrderHistoryInitial()) {
    on<LoadOrdersEvent>((event, emit) {
      emit(OrderHistoryLoading());

      final orders = [
        {
          'id': '#1001',
          'items': 'Cheese Pizza, Coca Cola',
          'total': '\$15.00',
          'status': 'Delivered',
          'date': '12 Sep 2026',
          'payment': 'Cash on Delivery',
          'address': 'Islamabad, Pakistan',
        },
        {
          'id': '#1002',
          'items': 'Cheese Burger, Fries',
          'total': '\$14.00',
          'status': 'Delivered',
          'date': '14 Sep 2026',
          'payment': 'EasyPaisa',
          'address': 'Rawalpindi, Pakistan',
        },
        {
          'id': '#1003',
          'items': 'Fried Chicken',
          'total': '\$13.00',
          'status': 'Delivered',
          'date': '15 Sep 2026',
          'payment': 'Credit/Debit Card',
          'address': 'Islamabad, Pakistan',
        },
      ];

      emit(OrderHistoryLoaded(orders));
    });
  }
}