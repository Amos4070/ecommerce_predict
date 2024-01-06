import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

import 'correct_password.dart';
import 'customer_login/customer_login.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // firebase authentication instance

  // final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  var email;
  var password;
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // this is to dismiss the keyboard
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFBEFEF),
        body: ModalProgressHUD(
          // this if for loading
          inAsyncCall: showSpinner,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/splashlogo/splashlogo1.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                TextField(
                  //focusNode: _focusNode,
                  keyboardType: TextInputType
                      .emailAddress, // this allow your keyboard to have email
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    email = value; //Do something with the user input.
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
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
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  //focusNode: _focusNode,
                  obscureText: true, // this secure our password
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    password = value; //Do something with the user input.
                  },
                  decoration: const InputDecoration(
                    hintText: 'enter your password',
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
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  //focusNode: _focusNode,
                  obscureText: true, // this secure our password
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    password = value; //Do something with the user input.
                  },
                  decoration: const InputDecoration(
                    hintText: 'confirm password',
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
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(CustomerLoginScreen(),
                              transition: Transition.upToDown,
                              duration: const Duration(milliseconds: 2000));
                        },
                        child: const Text(
                          ' try login',
                          style: TextStyle(
                              // decoration: TextDecoration.underline,
                              color: Colors.blue,
                              fontSize: 11,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(CorrectPassword(),
                              transition: Transition.fadeIn,
                              duration: const Duration(milliseconds: 2000));
                        },
                        child: const Text(
                          ' forgot password',
                          style: TextStyle(
                              //decoration: TextDecoration.underline,
                              color: Colors.blue,
                              fontSize: 11,
                              fontStyle: FontStyle.italic),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: const Color(0xff644D33),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        setState(
                          () {
                            showSpinner = true;
                          },
                        );

                        // try {
                        //   final newUser =
                        //       await _auth.createUserWithEmailAndPassword(
                        //           email: email, password: password);
                        //   // the code above is an async method
                        //
                        //   if (newUser != null) {
                        //     Navigator.pushNamed(context, 'chat_screen');
                        //
                        //     // this will push to the next screen was declared in the main
                        //   }
                        //
                        //   setState(() {
                        //     showSpinner = false;
                        //   });
                        // } catch (e) {
                        //   print(e);
                        // }
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
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
