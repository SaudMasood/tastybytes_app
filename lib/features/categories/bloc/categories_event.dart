import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CategoriesEvent {}

class SelectCategoryEvent extends CategoriesEvent {
  final int index;

  SelectCategoryEvent(this.index);
}