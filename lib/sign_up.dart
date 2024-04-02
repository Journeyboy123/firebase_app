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
    var emailcontroller = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text('Name'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Name',
                ),
              ),
              //some space between name and email
              const SizedBox(
                height: 10,
              ),
              const Text('Email'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Email',
                ),
              ),
              //some space between email and mobile
              const SizedBox(
                height: 10,
              ),
              const Text('Mobile'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: mobileController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Mobile',
                ),
              ),
             
              const Text('Address'),
             
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Address',
                ),
              ),
              //create button for register
                   Row(
                    children: [
                        ElevatedButton(
                          onPressed: () {
                             if (formKey.currentState?.validate() == true) {
                              firebaseAuth
                                  .createUserWithEmailAndPassword(
                                      email: emailcontroller.text.toString(),
                                      password:
                                          passwordController.text.toString())
                                  .then((value) => Navigator.pop(context))
                                  .onError((error, stackTrace) =>
                                      Fluttertoast.showToast(
                                          msg: error.toString()));
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => SignUp())));
                      
                      };
                    }, child: Text(
                        'Signup',
                        style: TextStyle(
                          fontSize: 30,
                          ),
                        ), 
                  ),
                ],
               ),
            ],
          ) )),
    );
  }
} 
 