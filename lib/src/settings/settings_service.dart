// Created by Muhammadjonov Abdulloh on 30.12.2022


import 'package:flutter/material.dart';


class SettingsService {

  Future<ThemeMode> themeMode() async => ThemeMode.light;

  Future<void> updateThemeMode(ThemeMode theme) async {}
}
