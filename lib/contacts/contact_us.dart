import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  final TextEditingController _textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFBEFEF),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Contact Us',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/assets/predictnew5.png'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  // text editing controller to get the text input by user
                  //controller: _textcontroller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name, // allow keyboard with email

                  style: TextStyle(color: Colors.black),

                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black12),
                    hintText: 'enter your name...',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  // text editing controller to get the text input by user
                  //  controller: _textcontroller,
                  textAlign: TextAlign.center,
                  keyboardType:
                      TextInputType.emailAddress, // allow keyboard with email

                  style: TextStyle(color: Colors.black),

                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black12),
                    hintText: 'enter email...',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textAlign: TextAlign.center,
                  // text editing controller to get the text input by user
                  //  controller: _textcontroller,
                  minLines: 1,
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    ),
                    hintStyle: TextStyle(color: Colors.black12),
                    hintText: 'enter message',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Material(
                    color: const Color(0xff644D33),
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      minWidth: 100.0,
                      height: 42.0,
                      child: const Text(
                        'Send',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
