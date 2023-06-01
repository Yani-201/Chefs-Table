import 'package:chefs_table/user/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserLoggedIn) {
              context.go('/home');
            }
            if (state is UserOperationFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text("Login failed: ${state.error}"),
                duration: const Duration(seconds: 3),
              ));
            }
          },
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text('Welcome back',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 41, 30, 69))),
                    const SizedBox(height: 10),
                    const Text('Login',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 41, 30, 69))),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                            ),
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Enter your username',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                            ),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Enter your password',
                                hintText: 'password',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Form is valid, navigate to home screen
                                print(_usernameController.text);
                                print(_passwordController.text);
                                BlocProvider.of<UserBloc>(context).add(
                                    UserLogIn(_usernameController.text,
                                        _passwordController.text));
                              }
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 41, 30, 69)),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(4)),
                              textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 25),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            child: Text('Don\'t have an account? Sign up'),
                            onPressed: () {
                              context.go('/signup');
                            },
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
