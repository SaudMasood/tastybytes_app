abstract class CheckoutState {
  final String address;
  final String paymentMethod;

  CheckoutState({
    this.address = '',
    this.paymentMethod = 'Cash on Delivery',
  });
}

class CheckoutInitial extends CheckoutState {}

class CheckoutUpdated extends CheckoutState {
  CheckoutUpdated({
    required super.address,
    required super.paymentMethod,
  });
}

class OrderPlaced extends CheckoutState {
  OrderPlaced({
    required super.address,
    required super.paymentMethod,
  });
}