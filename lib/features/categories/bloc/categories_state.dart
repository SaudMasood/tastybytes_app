abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<Map<String, Object>> categories;
  final int selectedIndex;

  CategoriesLoaded({
    required this.categories,
    this.selectedIndex = 0,
  });
}