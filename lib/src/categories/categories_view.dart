// Created by Muhammadjonov Abdulloh on 03.01.2023

import 'package:flutter/material.dart';
import 'package:test_app/src/categories/categories_controller.dart';


class CategoriesView extends StatelessWidget{
  CategoriesView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CategoriesController controller;
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        if(!controller.isLoading) {
          return Row(
            children: List.generate(controller.categories.length + 1, (index) {
              if(index == controller.categories.length) {
                return GestureDetector(
                  onTap: () {
                    showDialog(context: context, builder: (context) {
                      return SimpleDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        insetPadding: const EdgeInsets.all(0),
                        title: const Text(
                          "Добавить категорию",
                          textAlign: TextAlign.center,
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: SizedBox(
                              height: 48,
                              child: TextField(
                                controller: _textController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                                ),
                                onPressed: () => Navigator.pop(context),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Text(
                                    "Назад",
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Colors.greenAccent),
                                ),
                                onPressed: () {
                                  if(_textController.text.isNotEmpty) {
                                    controller.addData(_textController.text);
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text(
                                  "Добавить",
                                ),
                              ),
                            ],
                          ),
                        ],
                      );

                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0XFFEBEBEB),
                        width: 2,
                      ),
                    ),
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    child: const Text(
                      "Добавить",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }
              return Container(
                decoration: BoxDecoration(
                  color: index == 0 ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: index != 0 ? const Color(0XFFEBEBEB) : Colors.transparent,
                    width: 2,
                  ),
                ),
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                child: Text(
                  controller.categories[index],
                  style: TextStyle(
                    color: index == 0 ? Colors.white : Colors.black,
                  ),
                ),
              );
            }),
          );
        } else {
          return const LinearProgressIndicator();
        }
      }
    );
  }
}
