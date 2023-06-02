import 'package:chefs_table/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Best Food, Best Review',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Delicious dishes with rave reviews, curated just for you.',
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              child: const Text("Recipies"),
              onPressed: () {
                context.push('/recipe');
              },
            ),
            SizedBox(height: 8),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 8),
                children: [
                  // Add scrollable recipe images here
                  _buildImageContainer('assets/pasta.jpg'),
                ],
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              child: const Text("Restuarant"),
              onPressed: () {
                context.push('/restaurant');
              },
            ),
            SizedBox(height: 8),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 8),
                children: [
                  // Add scrollable restaurant images here
                  _buildImageContainer('assets/restaurant.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer(String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
// Column(
//         children: [
//           const Text("Welcome to chef's table"),
//           TextButton(
//             child: const Text("Recipies"),
//             onPressed: () {
//               context.push('/recipe');
//             },
//           ),
//           TextButton(
//             child: const Text("Restuarant"),
//             onPressed: () {
//               context.push('/restaurant');
//             },
//           ),
//           Container()
//         ],
//       ),