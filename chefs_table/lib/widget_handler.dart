<<<<<<< HEAD
import 'package:flutter/material.dart';

class WidgetHandler {
  List<Widget> buildStarBlock(int starSize) {
    List<Widget> stars = [];
    for (int i = 0; i < starSize; i++) {
      stars.add(const Icon(Icons.star, color: Colors.orange));
    }

    return stars;
  }
}
=======
import 'package:flutter/material.dart';

class WidgetHandler {
  List<Widget> buildStarBlock(int starSize) {
    List<Widget> stars = [];
    for (int i = 0; i < starSize; i++) {
      stars.add(const Icon(Icons.star, color: Colors.orange));
    }

    return stars;
  }
}
>>>>>>> c5908b340f33a5070444762cdbd02208ea618d6d
