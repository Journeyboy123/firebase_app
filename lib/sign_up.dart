import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // var emailcontroller = TextEditingController();
  // var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
            child: Container(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const Text('Name'),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Name',
                      ),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "Enter name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    //some space between name and email
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Email'),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Email',
                      ),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "Enter Email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    //some space between email and mobile
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Mobile'),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: mobileController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Mobile',
                      ),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "Enter Mobile";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Text('Password'),

                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Password',
                      ),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "Enter Password";
                        } else {
                          return null;
                        }
                      },
                    ),

                    const Text('Address'),

                    TextFormField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Address',
                      ),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "Enter Address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    //create button for register
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          firebaseAuth
                              .createUserWithEmailAndPassword(
                                  email: emailController.text.toString(),
                                  password: passwordController.text.toString())
                              .then((value) => Navigator.pop(context))
                              .onError((error, stackTrace) =>
                                  Fluttertoast.showToast(
                                      msg: error.toString()));
                        }
                        ;
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
