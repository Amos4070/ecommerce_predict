import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_predict/Authentication/customer_signup/customer_signup.dart';
import 'package:ecommerce_predict/Authentication/supplier_signUp/supplier_login.dart';
import 'package:ecommerce_predict/Authentication/supplier_signUp/supplier_signup.dart';
import 'package:ecommerce_predict/widget/yellowButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Authentication/customer_login/customer_login.dart';
import '../customer/customer_home/customer_home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

// todo this must not be the landing page, this is there own landing page
class _WelcomeScreenState extends State<WelcomeScreen> {
  bool processing = false;

  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');
  late String _uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/inapp/bgimage.jpg'),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'WELCOME',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(
                height: 120,
                width: 200,
                child: Image(image: AssetImage('images/inapp/logo.jpg')),
              ),
              const Text(
                'SHOP',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              topLeft: Radius.circular(50)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Supplier only',
                            style: TextStyle(
                                color: Colors.yellowAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 30),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              topLeft: Radius.circular(50)),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Image(
                                    image: AssetImage('images/inapp/logo.jpg')),
                                YellowButton(
                                    label: 'Log In',
                                    onPressed: () {
                                      Get.off(const SupplierLoginScreen());
                                    },
                                    width: 0.25),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: YellowButton(
                                      label: 'Sign Up',
                                      onPressed: () {
                                        Get.off(const SupplierRegistration());
                                      },
                                      width: 0.25),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              topRight: Radius.circular(50)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Customer only',
                            style: TextStyle(
                                color: Colors.yellowAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 30),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              topRight: Radius.circular(50)),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                YellowButton(
                                    label: 'Log In',
                                    onPressed: () {
                                      Get.off(CustomerLoginScreen());
                                    },
                                    width: 0.25),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: YellowButton(
                                      label: 'Sign Up',
                                      onPressed: () {
                                        Get.off(
                                            //todo this is where i called the cutomer registration screen
                                            const CustomerRegistration());
                                      },
                                      width: 0.25),
                                ),
                                const Image(
                                    image: AssetImage('images/inapp/logo.jpg')),
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Container(
                  height: 100,
                  decoration: const BoxDecoration(color: Colors.white38),
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
                      processing == true
                          ? const CircularProgressIndicator()
                          : GoogleFacebookLogin(
                              label: 'Guest',
                              onPressed: () async {
                                setState(() {
                                  processing = true;
                                });

                                await FirebaseAuth.instance
                                    .signInAnonymously()
                                    .whenComplete(() async {
                                  _uid = FirebaseAuth.instance.currentUser!.uid;
                                  await customers.doc(_uid).set({
                                    'name': '',
                                    'email': '',
                                    'profileImage': '',
                                    'phone': '',
                                    'address': '',
                                    'cid': _uid
                                  });
                                });

                                Get.off(const CustomerHomeScreen());
                              },
                              child: const Icon(
                                Icons.person,
                                size: 60,
                                color: Colors.lightBlueAccent,
                              ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleFacebookLogin extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Widget child;
  const GoogleFacebookLogin({
    super.key,
    required this.label,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            SizedBox(width: 50, height: 60, child: child),
            Text(
              label,
              style: const TextStyle(color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
