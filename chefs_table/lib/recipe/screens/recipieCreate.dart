<<<<<<< HEAD
import 'package:chefs_table/recipe/blocs/blocs.dart';
import 'package:chefs_table/recipe/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RecipeCreationPage extends StatefulWidget {
  const RecipeCreationPage({super.key});

  @override
  _RecipeCreationPageState createState() => _RecipeCreationPageState();
}

class _RecipeCreationPageState extends State<RecipeCreationPage> {
  String chefName = '';
  String name = '';
  String procedure = '';
  int time = 0;
  List<String> ingredients = [];
  String foodImageUrl = '';

  void addIngredient() {
    setState(() {
      ingredients.add('');
    });
  }

  void uploadFoodImage() {
    // Implement photo upload functionality for food image
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Recipe'),
        leading: BackButton(
          onPressed: () => context.go('/recipe'),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            // Wrap the Column with SingleChildScrollView
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                const Text(
                  'Recipe Name:',
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
                    hintText: 'Enter name',
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
                      name = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                const Text(
                  'Procedure:',
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
                    hintText: 'Enter procedure',
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
                      procedure = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                const Text(
                  'Time:',
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
                    hintText: 'Enter time in minutes',
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
                      time = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Ingredients:',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) {
                    return TextFormField(
                      style: const TextStyle(color: Colors.orange),
                      decoration: InputDecoration(
                        hintText: 'Enter ingredient ${index + 1}',
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
                          ingredients[index] = value;
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: addIngredient,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.black,
                  ),
                  child: Text('Add Ingredient'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Save recipe logic here
                    Recipe recipe = Recipe(
                        id: null,
                        title: name,
                        ingredients: ingredients,
                        procedure: procedure,
                        time: time);
                    BlocProvider.of<RecipeBloc>(context)
                        .add(RecipeCreate(recipe));
                    context.go('/recipe');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.black,
                  ),
                  child: Text('Save Recipe'),
                ),
                SizedBox(height: 16),
                Text(
                  'Food Image:',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: uploadFoodImage,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Icon(
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
    );
  }
}
=======
import 'package:chefs_table/recipe/blocs/blocs.dart';
import 'package:chefs_table/recipe/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RecipeCreationPage extends StatefulWidget {
  const RecipeCreationPage({super.key});

  @override
  _RecipeCreationPageState createState() => _RecipeCreationPageState();
}

class _RecipeCreationPageState extends State<RecipeCreationPage> {
  String chefName = '';
  String name = '';
  String procedure = '';
  int time = 0;
  List<String> ingredients = [];
  String foodImageUrl = '';

  void addIngredient() {
    setState(() {
      ingredients.add('');
    });
  }

  void uploadFoodImage() {
    // Implement photo upload functionality for food image
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Recipe'),
        leading: BackButton(
          onPressed: () => context.go('/recipe'),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            // Wrap the Column with SingleChildScrollView
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                const Text(
                  'Recipe Name:',
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
                    hintText: 'Enter name',
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
                      name = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                const Text(
                  'Procedure:',
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
                    hintText: 'Enter procedure',
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
                      procedure = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                const Text(
                  'Time:',
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
                    hintText: 'Enter time in minutes',
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
                      time = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Ingredients:',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) {
                    return TextFormField(
                      style: const TextStyle(color: Colors.orange),
                      decoration: InputDecoration(
                        hintText: 'Enter ingredient ${index + 1}',
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
                          ingredients[index] = value;
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: addIngredient,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.black,
                  ),
                  child: Text('Add Ingredient'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Save recipe logic here
                    Recipe recipe = Recipe(
                        id: null,
                        title: name,
                        ingredients: ingredients,
                        procedure: procedure,
                        time: time);
                    BlocProvider.of<RecipeBloc>(context)
                        .add(RecipeCreate(recipe));
                    context.go('/recipe');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.black,
                  ),
                  child: Text('Save Recipe'),
                ),
                SizedBox(height: 16),
                Text(
                  'Food Image:',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: uploadFoodImage,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Icon(
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
    );
  }
}
>>>>>>> c5908b340f33a5070444762cdbd02208ea618d6d
