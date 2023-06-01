import 'package:chefs_table/restaurant/models/restaurant.dart';
import 'package:chefs_table/user/data_providers/jwt_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RestaurantDetail extends StatelessWidget {
  final Restaurant restaurant;
  static const String _baseUrl = "http://10.0.2.2:3001/";

  const RestaurantDetail({super.key, required this.restaurant});

  List<Widget> buildStarBlock(int starSize) {
    List<Widget> stars = [];
    for (int i = 0; i < starSize; i++) {
      stars.add(const Icon(Icons.star, color: Colors.yellowAccent));
    }

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 234, 177, 152),
          // leading: Builder(
          //   builder: (context) =>
          //       IconButton(onPressed: null, icon: BackButton()),
          // ),
          leading: BackButton(
            onPressed: () => context.go('/restaurant'),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  TokenStorage().deleteToken();
                  context.go('/login');
                },
                icon: const Icon(Icons.logout_rounded)),
            PopupMenuButton(
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                    child: const Text('EDIT'),
                    onTap: () =>
                        context.push('/editRestaurant', extra: restaurant)),
                PopupMenuItem(
                    child: const Text('Delete'),
                    onTap: () =>
                        context.push('/deleteRestaurant', extra: restaurant)),
              ],
            ),
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text(restaurant.name)],
          )),
      body: ListView(children: [
        Card(
          //color: Colors.black,
          elevation: 5,
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Container(
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  image: DecorationImage(
                      image: (restaurant.photo != null)
                          ? Image.network("$_baseUrl${restaurant.photo}").image
                          : Image.asset("assets/restaurant.png").image,
                      fit: BoxFit.cover)),
            ),
          ),
        ),
        Container(
          height: 30,
        ),
        Container(
          decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(16),
            color: Color.fromARGB(255, 234, 177, 152),
          ),
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(restaurant.name,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Container(
          height: 20,
        ),
        Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text('foods'), Text('prices')],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: restaurant.menu != null
                  ? restaurant.menu!.map((e) {
                      return Text(
                          "- ${e['name']} .............................${e['price']}");
                    }).toList()
                  : [const Text("No menu")],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Contact Us"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.black87,
                  ),
                  Text(
                    restaurant.location,
                  )
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
                Text(restaurant.phone)
              ]),
            ],
          ),
        )

        // Container(
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10),
        //       boxShadow: [
        //         BoxShadow(
        //           offset: Offset(0, 1),
        //           blurRadius: 5,
        //           color: Colors.black.withOpacity(0.3),
        //         ),
        //       ]),
        //   padding: const EdgeInsets.all(8),
        //   margin: const EdgeInsets.all(10),
        //   child: Column(
        //     children: [
        //       const Center(
        //         child: Text(
        //           'Review and rating',
        //           style: TextStyle(
        //             fontSize: 15,
        //           ),
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       const TextField(
        //         minLines: 4,
        //         maxLines: 8,
        //         decoration: InputDecoration(
        //             hintText: 'leave a review',
        //             focusedBorder: OutlineInputBorder(),
        //             enabledBorder: OutlineInputBorder(
        //                 borderSide: BorderSide(color: Colors.deepPurple))),
        //       ),
        //       Text('how was your experience'),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Row(
        //           children: buildStarBlock(5 as int),
        //         ),
        //       )
        //     ],
        //   ),
        // )
      ]),
    );
  }
}
