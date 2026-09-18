import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final categories = const [
    'All',
    'Pizza',
    'Burger',
    'Pasta',
    'Drinks',
  ];

  final icons = const [
    Icons.apps,
    Icons.local_pizza,
    Icons.lunch_dining,
    Icons.ramen_dining,
    Icons.local_drink,
  ];

  final foods = const [
    {
      'name': 'Cheese Burger',
      'price': '\$12.99',
      'image': 'assets/food/burger.png',
    },
    {
      'name': 'Italian Pizza',
      'price': '\$15.99',
      'image': 'assets/food/pizza.png',
    },
    {
      'name': 'Creamy Pasta',
      'price': '\$10.99',
      'image': 'assets/food/pasta.png',
    },
  ];

  HomeBloc() : super(HomeInitial()) {
    on<SelectCategoryEvent>((event, emit) {
      emit(HomeCategoryChanged(event.index));
    });
  }
}