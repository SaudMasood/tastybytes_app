import 'package:flutter_bloc/flutter_bloc.dart';

import 'checkout_event.dart';
import 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutInitial()) {
    on<SelectPaymentMethod>((event, emit) {
      emit(
        CheckoutUpdated(
          address: state.address,
          paymentMethod: event.paymentMethod,
        ),
      );
    });

    on<ChangeAddress>((event, emit) {
      emit(
        CheckoutUpdated(
          address: event.address,
          paymentMethod: state.paymentMethod,
        ),
      );
    });

    on<PlaceOrder>((event, emit) {
      emit(
        OrderPlaced(
          address: state.address,
          paymentMethod: state.paymentMethod,
        ),
      );
    });
  }
}