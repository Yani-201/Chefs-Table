import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}
import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}
import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}
import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}

import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}
import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}

import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}
import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}
import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}
import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}

import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}
import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}

import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}
import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}

import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}
import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}
import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}
import 'package:chefs_table/widget_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavBar.dart';

class RecipeList extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
    {
      "name": "Pasta",
      "image": "assets/pasta.jpg",
      "time": "20 mins",
      "review": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: const Text('Chef\'s Table'),
            backgroundColor: Color.fromARGB(255, 43, 30, 73)),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Find the recipies to your favourite meals",
                    style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Type a Food Name',
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
                Column(
                    children: data.map((e) {
                  return InkWell(
                    onTap: (() {
                      context.go('/recipeDetail');
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 120,
                              child: Image.asset(
                                e['image'].toString(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: WidgetHandler()
                                      .buildStarBlock(e['review'] as int),
                                ),
                                Text(e['name'] as String),
                                Text("Prep Time: ${e['time']}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList())
              ],
            ),
          )
        ]));
  }
}


