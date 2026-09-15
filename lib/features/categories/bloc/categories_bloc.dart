import 'package:flutter_bloc/flutter_bloc.dart';

import 'categories_event.dart';
import 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<SelectCategoryEvent>((event, emit) {
      emit(CategorySelected(event.index));
    });
  }
}