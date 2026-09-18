abstract class HomeState {
  final int selectedCategory;

  HomeState(this.selectedCategory);
}

class HomeInitial extends HomeState {
  HomeInitial() : super(0);
}

class HomeCategoryChanged extends HomeState {
  HomeCategoryChanged(int index) : super(index);
}