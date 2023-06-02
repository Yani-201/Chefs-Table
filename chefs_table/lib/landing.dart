import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 20,
      //   title: const Text(
      //     'Chefs Table',
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 180,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                    ),
                    color: Color.fromARGB(255, 41, 30, 69)),
                child: Stack(
                  children: [
                    Positioned(
                        top: 80,
                        left: 0,
                        child: Container(
                          height: 70,
                          width: 190,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50))),
                        )),
                    const Positioned(
                        top: 100,
                        left: 15,
                        child: Text(
                          "chef's Table",
                          style: TextStyle(
                              color: Color.fromARGB(255, 43, 30, 73),
                              fontSize: 20),
                        ))
                  ],
                ),
              ),
              SizedBox(height: 18),
              const Text(
                'Welcome',
                style: TextStyle(
                  color: Color.fromARGB(255, 30, 23, 48),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/landing_page.png',
                height: 200,
                width: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 32),
              Wrap(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 43, 30, 73))),
                    onPressed: () {
                      context.go('/login');
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 43, 30, 73),
                    )),
                    onPressed: () {
                      context.go('/signup');
                    },
                    child: const Text('Sign up'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'The Ultimate Place For Finding The best Food !!!',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 30, 23, 48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
