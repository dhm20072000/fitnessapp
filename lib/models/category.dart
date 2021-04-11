import 'package:flutter/material.dart';

class Category {
  final String title;
  final String image;

  Category({@required this.title, @required this.image});

}

final List<Category> categories = [
  Category(title: 'Abs', image: 'assets/abs.png'),
  Category(title: 'Arm', image: 'assets/arm.png'),
  Category(title: 'Back', image: 'assets/back.png'),
  Category(title: 'Chest', image: 'assets/chest.png'),
  Category(title: 'Glute', image: 'assets/glute.png'),
  Category(title: 'Leg', image: 'assets/legs.png'),
  Category(title: 'Shoulder', image: 'assets/shoulder.png'),
  Category(title: 'Yoga', image: 'assets/yoga.png'),
];