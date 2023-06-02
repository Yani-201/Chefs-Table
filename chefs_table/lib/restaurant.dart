import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:chefs_table/NavBar.dart';
import 'package:chefs_table/widget_handler.dart';

class restaurant extends StatelessWidget {
  restaurant({super.key});

  List<Map<String, Object>> data = [
    {
      "name": "maleda restaurant",
      "image": "assets/pasta.jpg",
      "head_chef": "chef Abebe",
      "review": "5",
    },
    {
      "name": "maleda restaurant",
      "image": "assets/pasta.jpg",
      "head_chef": "chef Abebe",
      "review": "5",
    },
    {
      "name": "maleda restaurant",
      "image": "assets/pasta.jpg",
      "head_chef": "chef Abebe",
      "review": "5",
    },
    {
      "name": "maleda restaurant",
      "image": "assets/pasta.jpg",
      "head_chef": "chef Abebe",
      "review": "5",
    },
    {
      "name": "maleda restaurant",
      "image": "assets/pasta.jpg",
      "head_chef": "chef Abebe",
      "review": "5",
    },
    {
      "name": "maleda restaurant",
      "image": "assets/pasta.jpg",
      "head_chef": "chef Abebe",
      "review": "5",
    },
    {
      "name": "maleda restaurant",
      "image": "assets/pasta.jpg",
      "head_chef": "chef Abebe",
      "review": "5",
    }
  ];

  List<Widget> buildStarBlock(int starSize) {
    List<Widget> stars = [];
    for (int i = 0; i < starSize; i++) {
      stars.add(Icon(Icons.star, color: Colors.yellowAccent));
    }

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(),
        body: ListView(
          padding: EdgeInsets.all(5),
          children: [
            Text(
              'Rate your experience',
              style: TextStyle(fontSize: 24),
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
                onTap: () => context.go('/restaurantDetail'),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 160,
                        height: 120,
                        child: Image.asset(
                          e['image'] as String,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/pasta.jpg'),
                            radius: 30,
                          ),
                          Text(e['head_chef'].toString()),
                          Text(
                            e['name'].toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          Row(
                            children: [
                              Text(
                                e['review'].toString(),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellowAccent,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }).toList()),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ]),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    PopupMenuButton(
                        itemBuilder: (BuildContext context) => [
                              PopupMenuItem(child: Text('EDIT')),
                              PopupMenuItem(child: Text('Delete'))
                            ]),
                  ]),
                  const Center(
                    child: Text(
                      'Review and rating',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  const TextField(
                    minLines: 4,
                    maxLines: 8,
                    decoration: InputDecoration(
                        hintText: 'leave a review',
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple))),
                  ),
                  Text('how was your experience'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: buildStarBlock(5 as int),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
