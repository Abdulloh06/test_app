// Created by Muhammadjonov Abdulloh on 30.12.2022


import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:test_app/src/categories/categories_view.dart';
import 'package:test_app/src/sample_feature/sample_controller.dart';
import 'package:test_app/src/sample_feature/sample_service.dart';

import '../categories/categories_controller.dart';
import '../categories/categories_service.dart';


class SampleItemListView extends StatefulWidget {
  const SampleItemListView({super.key,});

  static const routeName = '/';

  @override
  State<SampleItemListView> createState() => _SampleItemListViewState();
}

class _SampleItemListViewState extends State<SampleItemListView> {

  final _service = SampleService();
  late final SampleController _controller;

  final _categoriesService = CategoriesService();
  late final CategoriesController _categoriesController;

  int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _categoriesController = CategoriesController(_categoriesService);
    _categoriesController.getData();
    _controller = SampleController(_service);
    _controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Мои коды',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      iconSize: 27,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 52),
                Expanded(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      if(!_controller.isLoading) {
                        return Column(
                          children: [
                            CategoriesView(
                              controller: _categoriesController,
                            ),
                            const SizedBox(height: 42),
                            Expanded(
                              child: ListView.separated(
                                restorationId: 'sampleItemListView',
                                itemCount: _controller.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(67, 133, 246, 0.2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ListTile(
                                      onTap: () {},
                                      title: Text(_controller.data[index].title),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 18,
                                        vertical: 14,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      leading: const CircleAvatar(
                                        radius: 36,
                                        backgroundColor: Color(0XFF4D8EFF),
                                        child: Icon(
                                          Icons.qr_code,
                                          color: Colors.black,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 14);
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: GNav(
          backgroundColor: Colors.black,
          activeColor: Colors.black,
          color: Colors.white,
          selectedIndex: currentIndex,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          iconSize: 30,
          gap: 10,
          padding: const EdgeInsets.symmetric(
            horizontal: 11,
            vertical: 10,
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
          tabMargin: const EdgeInsets.symmetric(vertical: 22),
          tabs: const [
            GButton(
              icon: Icons.settings,
              text: 'Настройки',
              backgroundColor: Colors.purple,
            ),
            GButton(
              icon: Icons.qr_code,
              text: 'Мои коды',
              backgroundColor: Color(0xffCDC1FF),
            ),
            GButton(
              icon: Icons.person,
              text: 'Профиль',
              backgroundColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
