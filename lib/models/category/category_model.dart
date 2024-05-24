import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String image;
  String name;
  Color color;
  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.color});
}
