import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddCartItem>((event, emit) {
      final items = List<Map<String, Object>>.from(state.items);

      final newItem = Map<String, Object>.from(event.item);

      final existingIndex = items.indexWhere(
            (item) => item['name'] == newItem['name'],
      );

      if (existingIndex != -1) {
        final quantity =
        items[existingIndex]['quantity'] as int;

        final newQuantity =
        newItem['quantity'] as int;

        items[existingIndex]['quantity'] =
            quantity + newQuantity;
      } else {
        items.add(newItem);
      }

      emit(CartUpdated(items));
    });

    on<IncreaseCartQuantity>((event, emit) {
      final items = List<Map<String, Object>>.from(state.items);

      final quantity = items[event.index]['quantity'] as int;

      items[event.index]['quantity'] = quantity + 1;

      emit(CartUpdated(items));
    });

    on<DecreaseCartQuantity>((event, emit) {
      final items = List<Map<String, Object>>.from(state.items);

      final quantity = items[event.index]['quantity'] as int;

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
  }
}