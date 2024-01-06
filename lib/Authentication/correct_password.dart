import 'package:flutter/material.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class CorrectPassword extends StatefulWidget {
  @override
  _CorrectPasswordState createState() => _CorrectPasswordState();
}

class _CorrectPasswordState extends State<CorrectPassword> {
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
                TextField(
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
                    hintText: 'enter old password',
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
                    hintText: 'enter password',
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
                  height: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: const Color(0xff644D33),
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
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
                        'Click to change',
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
