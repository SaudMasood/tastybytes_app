import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {

    on<AddCartItem>((event, emit) {
      final items = List<Map<String, Object>>.from(state.items);
      final newItem = Map<String, Object>.from(event.item);

      final index = items.indexWhere(
            (item) => item['name'] == newItem['name'],
      );

      if (index != -1) {
        items[index]['quantity'] =
            (items[index]['quantity'] as int) +
                (newItem['quantity'] as int);
      } else {
        items.add(newItem);
      }

      emit(CartUpdated(items));
    });

    on<IncreaseCartQuantity>((event, emit) {
      final items = List<Map<String, Object>>.from(state.items);

      items[event.index]['quantity'] =
          (items[event.index]['quantity'] as int) + 1;

      emit(CartUpdated(items));
    });

    on<DecreaseCartQuantity>((event, emit) {
      final items = List<Map<String, Object>>.from(state.items);

      final quantity =
      items[event.index]['quantity'] as int;

      if (quantity > 1) {
        items[event.index]['quantity'] = quantity - 1;
      }

      emit(CartUpdated(items));
    });

    on<RemoveCartItem>((event, emit) {
      final items = List<Map<String, Object>>.from(state.items);

      items.removeAt(event.index);

      if (items.isEmpty) {
        emit(CartEmpty());
      } else {
        emit(CartUpdated(items));
      }
    });

    on<CheckoutPressed>((event, emit) {
      emit(
        CartUpdated(
          state.items,
          isPressed: true,
        ),
      );
    });

    on<CheckoutReset>((event, emit) {
      emit(
        CartUpdated(
          state.items,
          isPressed: false,
        ),
      );
    });
  }
}