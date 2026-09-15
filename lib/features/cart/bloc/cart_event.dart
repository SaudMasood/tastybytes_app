abstract class CartEvent {}

class AddCartItem extends CartEvent {
  final Map<String, Object> item;
  AddCartItem(this.item);
}

class IncreaseCartQuantity extends CartEvent {
  final int index;
  IncreaseCartQuantity(this.index);
}

class DecreaseCartQuantity extends CartEvent {
  final int index;
  DecreaseCartQuantity(this.index);
}

class RemoveCartItem extends CartEvent {
  final int index;
  RemoveCartItem(this.index);
}

class CheckoutPressed extends CartEvent {}

class CheckoutReset extends CartEvent {}