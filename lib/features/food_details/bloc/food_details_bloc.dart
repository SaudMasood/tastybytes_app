import 'package:flutter_bloc/flutter_bloc.dart';

import 'food_details_event.dart';
import 'food_details_state.dart';

class FoodDetailsBloc
    extends Bloc<FoodDetailsEvent, FoodDetailsState> {
  FoodDetailsBloc() : super(FoodDetailsInitial()) {
    on<IncreaseQuantity>((event, emit) {
      int quantity = 1;

      if (state is FoodDetailsInitial) {
        quantity = (state as FoodDetailsInitial).quantity;
      }

      if (state is QuantityChanged) {
        quantity = (state as QuantityChanged).quantity;
      }

      emit(QuantityChanged(quantity + 1));
    });

    on<DecreaseQuantity>((event, emit) {
      int quantity = 1;

      if (state is FoodDetailsInitial) {
        quantity = (state as FoodDetailsInitial).quantity;
      }

      if (state is QuantityChanged) {
        quantity = (state as QuantityChanged).quantity;
      }

      if (quantity > 1) {
        emit(QuantityChanged(quantity - 1));
      }
    });

    on<AddToCart>((event, emit) {
      int quantity = 1;

      if (state is QuantityChanged) {
        quantity = (state as QuantityChanged).quantity;
      }

      emit(CartAdded(quantity));
    });
  }
}