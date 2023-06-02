<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          InkWell(
            onTap: () => context.push('/profile'),
            child: UserAccountsDrawerHeader(
                accountName: TextButton(
                  child: Text('Abebe'),
                  onPressed: () {},
                ),
                accountEmail: const Text('Abebe@gmail.com'),
                currentAccountPicture: CircleAvatar(
                    // child: ClipOval(
                    //     child: Image.asset('food.png',
                    //         width: 80, height: 80, fit: BoxFit.cover)),
                    ),
                decoration: const BoxDecoration(color: Colors.brown)),
          ),
          ListTile(
            leading: const Icon(Icons.house),
            title: const Text('Home'),
            onTap: () {
              context.go('/home');
            },
          ),
          ListTile(
            //leading: const Icon(Icons.house),
            title: const Text('Restaurant'),
            onTap: () {
              context.go('/restaurant');
            },
          ),
          ListTile(
            //leading: const Icon(Icons.house),
            title: const Text('Recipies'),
            onTap: () {
              context.go('/recipe');
            },
          )
        ],
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          InkWell(
            onTap: () => context.push('/profile'),
            child: UserAccountsDrawerHeader(
                accountName: TextButton(
                  child: Text('Abebe'),
                  onPressed: () {},
                ),
                accountEmail: const Text('Abebe@gmail.com'),
                currentAccountPicture: CircleAvatar(
                    // child: ClipOval(
                    //     child: Image.asset('food.png',
                    //         width: 80, height: 80, fit: BoxFit.cover)),
                    ),
                decoration: const BoxDecoration(color: Colors.brown)),
          ),
          ListTile(
            leading: const Icon(Icons.house),
            title: const Text('Home'),
            onTap: () {
              context.go('/home');
            },
          ),
          ListTile(
            //leading: const Icon(Icons.house),
            title: const Text('Restaurant'),
            onTap: () {
              context.go('/restaurant');
            },
          ),
          ListTile(
            //leading: const Icon(Icons.house),
            title: const Text('Recipies'),
            onTap: () {
              context.go('/recipe');
            },
          )
        ],
      ),
    );
  }
}
>>>>>>> c5908b340f33a5070444762cdbd02208ea618d6d
