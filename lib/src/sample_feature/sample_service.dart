// Created by Muhammadjonov Abdulloh on 31.12.2022

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:test_app/src/sample_feature/sample_item.dart';

class SampleService {

  Future<List<SampleItem>> getItems() async {

    try {

      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos'),
      );

      if(response.statusCode == HttpStatus.ok) {
        final data = jsonDecode(response.body);
        return SampleItem.fetchData(data);
      } else {
        throw Exception(response.reasonPhrase);
      }

    } catch(_) {
      throw Exception('UNKNOWN');
    }
  }

}