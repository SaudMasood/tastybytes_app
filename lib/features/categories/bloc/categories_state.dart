abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {
  final int selectedIndex;

  CategoriesInitial({this.selectedIndex = 0});
}

class CategorySelected extends CategoriesState {
  final int selectedIndex;

  CategorySelected(this.selectedIndex);
}