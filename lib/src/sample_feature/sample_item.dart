// Created by Muhammadjonov Abdulloh on 30.12.2022

import 'package:flutter/foundation.dart';

@immutable
class SampleItem {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  const SampleItem({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  factory SampleItem.fromJson(Map<String, dynamic> json) {
    return SampleItem(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  static List<SampleItem> fetchData(List data) {
    List<SampleItem> items = [];

    for(int i = 0; i < data.length; i++) {
      items.add(SampleItem.fromJson(data[i]));
    }
    return items;
  }
}
