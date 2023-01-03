// Created by Muhammadjonov Abdulloh on 03.01.2023


import 'package:flutter/material.dart';
import 'package:test_app/src/categories/categories_service.dart';

class CategoriesController with ChangeNotifier {

  CategoriesController(this._service);

  final CategoriesService _service;


  bool _isLoading = true;
  late List<String> _categories;

  bool get isLoading => _isLoading;
  List<String> get categories => _categories;

  Future<void> getData() async {
    _isLoading = true;
    _categories = await _service.getCategories();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addData(String newValue) async {
    _categories.add(newValue);
    _service.addCategory(_categories);
    notifyListeners();
  }

}