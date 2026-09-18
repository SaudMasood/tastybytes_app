abstract class HomeEvent {}

class SelectCategoryEvent extends HomeEvent {
  final int index;

  SelectCategoryEvent(this.index);
}