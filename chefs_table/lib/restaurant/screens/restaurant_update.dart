import 'package:chefs_table/restaurant/blocs/blocs.dart';
import 'package:chefs_table/restaurant/models/restaurant.dart';
import 'package:chefs_table/restaurant/models/restaurantUpdateDto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditRestaurant extends StatefulWidget {
  final Restaurant restaurant;
  const EditRestaurant({super.key, required this.restaurant});

  @override
  _EditRestaurantState createState() => _EditRestaurantState(this.restaurant);
}

class _EditRestaurantState extends State<EditRestaurant> {
  final Restaurant restaurant;
  String name = '';
  String location = '';
  String phone = '';
  int time = 0;
  List<String> menuItems = [];
  String foodImageUrl = '';

  _EditRestaurantState(this.restaurant);

  void addMenuItem() {
    setState(() {
      menuItems.add('');
    });
  }

  void uploadFoodImage() {
    // Implement photo upload functionality for food image
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Restaurant'),
        leading: BackButton(
          onPressed: () => context.go('/restaurant'),
        ),
      ),
      body: BlocListener<RestaurantBloc, RestaurantState>(
        listener: (context, state) {
          if (state is RestaurantOperationSuccess) {
            context.go('/restaurant');
          }
          if (state is RestaurantOperationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text("Restaurant Update failed: ${state.error}"),
              duration: const Duration(seconds: 2),
            ));
            BlocProvider.of<RestaurantBloc>(context).add(RestaurantLoad());
          }
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              // Wrap the Column with SingleChildScrollView
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name:',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.orange),
                      decoration: const InputDecoration(
                        hintText: 'Restaurant Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  const Text(
                    'Location:',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    style: TextStyle(color: Colors.orange),
                    decoration: const InputDecoration(
                      hintText: 'Enter location for the restaurant',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        location = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  const Text(
                    'Phone No.:',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    style: TextStyle(color: Colors.orange),
                    decoration: const InputDecoration(
                      hintText: "Enter your restaurant's phone number",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        phone = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Menu Items:',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      return TextFormField(
                        style: const TextStyle(color: Colors.orange),
                        decoration: InputDecoration(
                          hintText:
                              ' ${index + 1}. Menu item like: "Food: Price"(eg. Burger: 100)',
                          hintStyle: const TextStyle(color: Colors.grey),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            menuItems[index] = value;
                          });
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: addMenuItem,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.black,
                    ),
                    child: Text('Add Menu Item'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Save restaurant logic here
                      // print(location);
                      // print(menuItems);
                      // print(phone);
                      // print(name);
                      var menuItemSplitted = menuItems.map((e) => e.split(':'));
                      List<Map<String, dynamic>> menu = [];
                      for (var i in menuItemSplitted) {
                        Map<String, dynamic> item = {};
                        item["name"] = i[0];
                        item["price"] = i.length > 1 ? i[1] : null;
                        menu.add(item);
                      }
                      RestaurantUpdateDto restaurantUpdate =
                          RestaurantUpdateDto(
                              name: name.isNotEmpty ? name : null,
                              location: location.isNotEmpty ? location : null,
                              phone: phone.isNotEmpty ? phone : null,
                              menu: menu.isNotEmpty ? menu : null);
                      BlocProvider.of<RestaurantBloc>(context).add(
                          RestaurantUpdate(restaurant.id!, restaurantUpdate));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.black,
                    ),
                    child: Text('Save Restaurant'),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Food Image:',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: uploadFoodImage,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
