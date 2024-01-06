import 'package:ecommerce_predict/Authentication/customer_signup/customer_signup.dart';
import 'package:ecommerce_predict/customer/customer_home/customer_home_screen.dart';
import 'package:ecommerce_predict/widget/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../splash_and_welcome_screen/welcomescreen_seller_buyer.dart';
import '../correct_password.dart';

class CustomerLoginScreen extends StatefulWidget {
  @override
  _CustomerLoginScreenState createState() => _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<CustomerLoginScreen> {
//  final _auth = FirebaseAuth.instance; // instance of auth
  late String email;
  late String password;
  bool showSpine = false;
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessangerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // to dismiss the keyboard
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFBEFEF),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              AssetImage('images/splashlogo/splashlogo1.png'))),
                  height: 300.0,
                  width: 200,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  keyboardType:
                      TextInputType.emailAddress, // allow keyboard with email

                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    email = value; // the value entered is saved to the email

                    //Do something with the user input.
                  },

                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black12),
                    hintText: 'Enter your email...',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  obscureText: true, // secure your password
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    password = value; // the value entered is saved to password
                    //Do something with the user input.
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your password.',
                    hintStyle: TextStyle(color: Colors.black12),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(const CustomerRegistration(),
                              transition: Transition.downToUp,
                              duration: const Duration(milliseconds: 500));
                        },
                        child: const Text(
                          'register',
                          style: TextStyle(
                              // decoration: TextDecoration.underline,
                              color: Colors.black87,
                              fontSize: 16,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(CorrectPassword(),
                              transition: Transition.fadeIn,
                              duration: const Duration(milliseconds: 10));
                        },
                        child: const Text(
                          ' forgot password',
                          style: TextStyle(
                              //decoration: TextDecoration.underline,
                              color: Colors.black87,
                              fontSize: 16,
                              fontStyle: FontStyle.italic),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: const Color(0xff644D33),
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email, password: password);

                          if (credential != null) {
                            Get.offAll(const CustomerHomeScreen());
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            MyMessageHandler.showSnackbar(
                                _scaffoldMessangerKey, 'User not found');
                          } else if (e.code == 'wrong-password') {
                            MyMessageHandler.showSnackbar(
                                _scaffoldMessangerKey, 'wrong-password');
                          }
                        }
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: const Text(
                        'Log In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 100,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GoogleFacebookLogin(
                        label: 'Google',
                        onPressed: () {},
                        child: const Image(
                          image: AssetImage('images/inapp/google.jpg'),
                        ),
                      ),
                      GoogleFacebookLogin(
                        label: 'Facebook',
                        onPressed: () {},
                        child: const Image(
                          image: AssetImage('images/inapp/facebook.jpg'),
                        ),
                      ),
                      GoogleFacebookLogin(
                          label: 'Guest',
                          onPressed: () {},
                          child: const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.lightBlueAccent,
                          ))
                    ],
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
