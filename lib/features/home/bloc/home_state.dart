abstract class HomeState {}

class HomeInitial extends HomeState {
  final int selectedCategory;

  HomeInitial({
    this.selectedCategory = 0,
  });
}

class HomeCategoryChanged extends HomeState {
  final int selectedCategory;

  HomeCategoryChanged(this.selectedCategory);
}