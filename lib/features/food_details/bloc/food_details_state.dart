abstract class FoodDetailsState {}

class FoodDetailsInitial extends FoodDetailsState {
  final int quantity;

  FoodDetailsInitial({this.quantity = 1});
}

class QuantityChanged extends FoodDetailsState {
  final int quantity;

  QuantityChanged(this.quantity);
}

class CartAdded extends FoodDetailsState {
  final int quantity;

  CartAdded(this.quantity);
}