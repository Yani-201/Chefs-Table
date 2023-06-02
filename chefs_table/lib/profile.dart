import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/profile_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ProfileBloc>();
    final state = bloc.state;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(child: ProfileScreen()),
      backgroundColor: Colors.black,
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ProfileBloc>();
    final state = bloc.state;

    if (state is ProfileInitial) {
      bloc.add(GiveMeData());
      return Center(
        child: CupertinoActivityIndicator(
          color: Colors.white,
        ),
      );
    } else if (state is ViewState) {
      return Container(
        constraints: const BoxConstraints(maxWidth: 200),

        // bool isChipEnabled = true;

        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (state.editable == true
                ? const Text(
                    'Gelila is Happy',
                    style: TextStyle(color: Colors.white),
                  )
                : const Text(
                    'Feven is Happy',
                    style: TextStyle(color: Colors.white),
                  )),
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/food.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe is',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
            (state.editable == true
                ? TextFormField(
                    initialValue: "jhon doe",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ))
                : Text(
                    "John Doe",
                    style: TextStyle(color: Colors.purple),
                  )
            // maxLength: 6,
            ),
            const SizedBox(height: 8),
            const Text(
              'john.doe@example.com',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Phone: 123-456-7890',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                bloc.add(EditableEvent());
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
                onPrimary: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
              ),
              child: (state.editable == false
                  ? Text('Edit Profile')
                  : Text("save profile")),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
                onPrimary: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
              ),
              child: const Text('Logout'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Role: Chef',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }
    //Add states here otherwise it'll be an error
    throw Exception("There is a new state you haven't added yet");
  }
}
