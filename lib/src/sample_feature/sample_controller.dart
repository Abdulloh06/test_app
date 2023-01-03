// Created by Muhammadjonov Abdulloh on 31.12.2022

import 'package:flutter/cupertino.dart';
import 'package:test_app/src/sample_feature/sample_item.dart';
import 'package:test_app/src/sample_feature/sample_service.dart';

class SampleController with ChangeNotifier {

  SampleController(this._sampleService);

  final SampleService _sampleService;

  late List<SampleItem> _data;

  bool _isLoading = true;

  List<SampleItem> get data => _data;
  bool get isLoading => _isLoading;

  Future<void> getData() async {
    _isLoading = true;
    try {
      final result = await _sampleService.getItems();
      _data = result;
    } catch(e) {
      debugPrint(e.toString());
      _data = [];
    }
    _isLoading = false;
    notifyListeners();
  }

}