abstract class CartState {
  final List<Map<String, Object>> items;

  CartState(this.items);
}

class CartInitial extends CartState {
  CartInitial() : super([]);
}

class CartUpdated extends CartState {
  CartUpdated(super.items);
}

class CartEmpty extends CartState {
  CartEmpty() : super([]);
}