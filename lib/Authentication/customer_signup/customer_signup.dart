import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_predict/Authentication/customer_login/customer_login.dart';
import 'package:ecommerce_predict/splash_and_welcome_screen/welcomescreen_seller_buyer.dart';
import 'package:ecommerce_predict/widget/regexp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../widget/auth_widget.dart';
import '../../widget/snackbar.dart';

class CustomerRegistration extends StatefulWidget {
  const CustomerRegistration({Key? key}) : super(key: key);

  @override
  State<CustomerRegistration> createState() => _CustomerRegistrationState();
}

class _CustomerRegistrationState extends State<CustomerRegistration> {
  bool passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// this _scaffoldMessangerKey declared her must come from a global key
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessangerKey =
      GlobalKey<ScaffoldMessengerState>();

  late String name;
  late String email;
  bool processing = false;
  late String password;
  late String profileImage;
  late String _uid;
  XFile? _imageFile;
  dynamic _pickImageError;
  final ImagePicker _picker = ImagePicker();

  /// this is for the cloud storage
  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');

  /// this is image picker and is going to be async method because we need to wait
  void _pickImageFromCamera() async {
    try {
      /// we need to safe the image picked in a variable and this is called pickedImage
      ///the pickedImage must be XFile type
      final pickedImage = await _picker.pickImage(
          source: ImageSource.camera,
          maxWidth: 300,
          maxHeight: 300,
          imageQuality: 99);
      setState(() {
        _imageFile = pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
      print(_pickImageError);
    }
  }

  /// this is image picker and is going to be async method because we need to wait
  void _pickImageFromGallery() async {
    try {
      /// we need to safe the image picked in a variable and this is called pickedImage
      ///the pickedImage must be XFile type
      final pickedImage = await _picker.pickImage(
          source: ImageSource.gallery,
          maxWidth: 300,
          maxHeight: 300,
          imageQuality: 99);
      setState(() {
        _imageFile = pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
      print(_pickImageError);
    }
  }

  void signUp() async {
    setState(() {
      processing = true;
    });

    /// this will help validate the input by user
    /// checking if non of it tends to null
    if (_formKey.currentState!.validate()) {
      if (_imageFile != null) {
        ///this is checking for validation of image pick
        ///this is used to create firebase auth account
        try {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);

          /// this allows the storage of our image to firebase and is going to reference all
          /// images with the customer email address
          firebase_storage.Reference ref = firebase_storage
              .FirebaseStorage.instance
              .ref("customer-images/$email.jpg");

          /// this will upload the image file
          await ref.putFile(File(_imageFile!.path));

          ///this will get the image url that is automatically assigned for the image
          profileImage = await ref.getDownloadURL();
          _uid = FirebaseAuth.instance.currentUser!.uid;
          await customers.doc(_uid).set({
            'name': name,
            'email': email,
            'profileImage': profileImage,
            'phone': '',
            'address': '',
            'cid': _uid
          });

          /// then set them all back to null
          _formKey.currentState!.reset();
          setState(() {
            _imageFile = null;
          });
          // TODO(musefiu_ojo_amos): try implement this later
          Get.offAll(CustomerLoginScreen());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            setState(() {
              processing = false;
            });
            MyMessageHandler.showSnackbar(
                _scaffoldMessangerKey, 'weak password');
          } else if (e.code == 'email-already-in-use') {
            setState(() {
              processing = false;
            });
            MyMessageHandler.showSnackbar(
                _scaffoldMessangerKey, 'email already in use try login');
          } else if (e.code == 'email-already-in-use' &&
              e.code == 'weak-password') {
            setState(() {
              processing = false;
            });
            MyMessageHandler.showSnackbar(_scaffoldMessangerKey,
                'email already existed, your password i weak');
          }
        }
      } else {
        setState(() {
          processing = false;
        });
        MyMessageHandler.showSnackbar(_scaffoldMessangerKey, e.toString());
      }
    } else {
      setState(() {
        processing = false;
      });
      MyMessageHandler.showSnackbar(
          _scaffoldMessangerKey, 'please fill all the fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessangerKey,
      child: Scaffold(
        backgroundColor: const Color(0xffFBEFEF),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthHeaderLabel(
                        headerLabel: 'Sign Up',
                        onPressed: () {
                          Get.off(const WelcomeScreen()
                              //todo the home button should go to customer design in your own design

                              );
                        },
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.pinkAccent,

                              /// making the selected image visible to the container, like
                              /// making the image the container background
                              backgroundImage: _imageFile == null
                                  ? null
                                  : FileImage(File(_imageFile!.path)),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xff644D33),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    /// here you will be allowed to pick image from camera
                                    _pickImageFromCamera();
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xff644D33),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.photo,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    /// you are going to pick image from gallery
                                    _pickImageFromGallery();
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(

                            /// this is the second method for getting
                            /// text from formfield
                            onChanged: (value) {
                              name = value;
                            },
                            //  controller: _nameController,

                            /// to validate text input
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                            decoration: textFormDecoration.copyWith(
                                labelText: 'Full Name',
                                hintText: 'Enter your name')),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(

                            /// this is the second method of getting
                            /// input text
                            onChanged: (value) {
                              email = value;
                            },
                            //controller: _emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email address';
                              }

                              /// this is regex used to validate the input if it is truly
                              /// an email input type
                              else if (value.isValidEmail() == false) {
                                return ' invalid email';
                              } else if (value.isValidEmail() == true) {
                                return null;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: textFormDecoration.copyWith(
                              labelText: 'Email Address',
                              hintText: 'Enter your email',
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                            onChanged: (value) {
                              password = value;
                            },
                            //controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your full password';
                              }
                              return null;
                            },
                            obscureText: passwordVisible,
                            keyboardType: TextInputType.emailAddress,
                            decoration: textFormDecoration.copyWith(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                icon: Icon(
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ),
                              labelText: 'Password',
                              hintText: 'Enter your password',
                            )),
                      ),
                      HaveAccount(
                        /// this is custom created class for login
                        haveAccount: 'already have account?',
                        actionLabel: 'Log In',
                        onPressed: () {
                          Get.off(CustomerLoginScreen(),
                              transition: Transition.leftToRightWithFade,
                              duration: const Duration(milliseconds: 500));
                        },
                      ),
                      processing == true
                          ? const CircularProgressIndicator(
                              color: Colors.purple,
                            )
                          : AuthMainButton(
                              buttonLabel: 'Sign Up',
                              onPressed: () {
                                signUp();
                              },
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
