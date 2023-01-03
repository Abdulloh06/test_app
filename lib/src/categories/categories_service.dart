// Created by Muhammadjonov Abdulloh on 03.01.2023

import 'package:shared_preferences/shared_preferences.dart';

class CategoriesService {

  Future<List<String>> getCategories() async {
    final prefs = await SharedPreferences.getInstance();

    final result = prefs.getStringList('category_key') ?? [];

    return result;
  }

  Future<String> addCategory(List<String> newCat) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('category_key', newCat);
    return "";
  }

}

