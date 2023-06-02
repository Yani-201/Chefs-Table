import 'dart:io';

import 'package:chefs_table/user/blocs/blocs.dart';
import 'package:chefs_table/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _userName;
  String? _password;
  String? _confirmPassword;
  File? _imageFile;
  String? _userType;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 30, 69),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            const Text('Sign Up',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            _pickImage();
                          },
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: _imageFile != null
                                ? FileImage(_imageFile!)
                                : AssetImage('assets/default_avatar.png')
                                    as ImageProvider<Object>?,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter your username',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _userName = value;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Enter your password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value;
// Check if the passwords match again after setting the password
// if (_confirmPassword != null &&
// _password != _confirmPassword) {
// _formKey.currentState!.validate();
// }
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Confirm your password',
                        ),
                        validator: (value) {
                          _formKey.currentState!.save();
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          } else if (_password != _confirmPassword) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _confirmPassword = value;
                        },
                      ),
                      SizedBox(height: 10),
                      Text('User Type:', style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'user',
                            groupValue: _userType,
                            onChanged: (value) {
                              setState(() {
                                _userType = value;
                              });
                            },
                          ),
                          Text('User', style: TextStyle(fontSize: 16)),
                          SizedBox(width: 20),
                          Radio<String>(
                            value: 'chef',
                            groupValue: _userType,
                            onChanged: (value) {
                              setState(() {
                                _userType = value;
                              });
                            },
                          ),
                          Text('Chef', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 41, 30, 69))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
// Process data.
                              _formKey.currentState!.save();
                              print('Full Name : $_email');
                              print('User Name : $_userName');
                              print('Password : $_password');
                              print('Confirm Password : $_confirmPassword');
                              print('User Type : $_userType');
                              User user = User(
                                  username: _userName!,
                                  email: _email!,
                                  password: _password,
                                  role: [_userType ?? 'user']);
                              BlocProvider.of<UserBloc>(context)
                                  .add(UserCreate(user));
                              context.go('/home');
                            }
                          },
                          child: const Text('Sign Up'),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go('/login');
                        },
                        child: const Text(
                          'Already have an account? Sign in',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
