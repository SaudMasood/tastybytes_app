abstract class CheckoutEvent {}

class SelectPaymentMethod extends CheckoutEvent {
  final String paymentMethod;

  SelectPaymentMethod(this.paymentMethod);
}

class ChangeAddress extends CheckoutEvent {
  final String address;

  ChangeAddress(this.address);
}

class PlaceOrder extends CheckoutEvent {}