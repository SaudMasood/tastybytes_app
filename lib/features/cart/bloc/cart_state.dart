abstract class CartState {
  final List<Map<String, Object>> items;
  final bool isPressed;

  CartState(this.items, {this.isPressed = false});
}

class CartInitial extends CartState {
  CartInitial() : super([]);
}

class CartUpdated extends CartState {
  CartUpdated(
      super.items, {
        super.isPressed,
      });
}

class CartEmpty extends CartState {
  CartEmpty() : super([]);
}