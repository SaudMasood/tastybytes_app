import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'categories_event.dart';
import 'categories_state.dart';

class CategoriesBloc
    extends Bloc<CategoriesEvent, CategoriesState> {

  final categories = const [
    {
      'name': 'Pizza',
      'icon': Icons.local_pizza,
    },
    {
      'name': 'Burger',
      'icon': Icons.lunch_dining,
    },
    {
      'name': 'Chicken',
      'icon': Icons.restaurant,
    },
    {
      'name': 'Drinks',
      'icon': Icons.local_drink,
    },
  ];

  final foods = const [
    {
      'category': 'Pizza',
      'name': 'Cheese Pizza',
      'price': '\$12',
      'icon': Icons.local_pizza,
    },
    {
      'category': 'Pizza',
      'name': 'Pepperoni Pizza',
      'price': '\$15',
      'icon': Icons.local_pizza,
    },
    {
      'category': 'Burger',
      'name': 'Cheese Burger',
      'price': '\$10',
      'icon': Icons.lunch_dining,
    },
    {
      'category': 'Burger',
      'name': 'Chicken Burger',
      'price': '\$11',
      'icon': Icons.lunch_dining,
    },
    {
      'category': 'Chicken',
      'name': 'Fried Chicken',
      'price': '\$13',
      'icon': Icons.restaurant,
    },
    {
      'category': 'Chicken',
      'name': 'Grilled Chicken',
      'price': '\$16',
      'icon': Icons.restaurant,
    },
    {
      'category': 'Drinks',
      'name': 'Coca Cola',
      'price': '\$3',
      'icon': Icons.local_drink,
    },
    {
      'category': 'Drinks',
      'name': 'Fresh Juice',
      'price': '\$5',
      'icon': Icons.local_drink,
    },
  ];

  CategoriesBloc() : super(CategoriesInitial()) {

    on<LoadCategories>((event, emit) async {
      emit(CategoriesLoading());

      await Future.delayed(
        const Duration(milliseconds: 500),
      );

      emit(
        CategoriesLoaded(
          categories: categories,
        ),
      );
    });

    on<SelectCategory>((event, emit) {
      emit(
        CategoriesLoaded(
          categories: categories,
          selectedIndex: event.index,
        ),
      );
    });
  }
}