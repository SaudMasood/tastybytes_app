abstract class CategoriesEvent {}

class LoadCategories extends CategoriesEvent {}

class SelectCategory extends CategoriesEvent {
  final int index;

  SelectCategory(this.index);
}