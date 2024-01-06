import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerce_predict/splash_and_welcome_screen/welcomescreen_seller_buyer.dart';
import 'package:flutter/material.dart';

const colorizeColors = [
  Colors.brown,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Horizon',
);

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    const SplashScreen();
    // TODO: implement initState

    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 5500),
        upperBound: 2.0,
        vsync: this);

    animation = ColorTween(begin: Colors.red[900], end: Colors.brown[700])
        .animate(controller);

    controller.forward();

    controller.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: animation.value,
      body: SafeArea(
        child: AnimatedSplashScreen(
            duration: 4500,
            splash: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("images/splashlogo/splashlogo1.png"),
                          fit: BoxFit.cover),
                      color: Colors.transparent,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                Expanded(
                    child: SizedBox(
                  width: 250.0,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        textAlign: TextAlign.center,
                        'PREDICT',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                      ColorizeAnimatedText(
                        textAlign: TextAlign.center,
                        'PRICES',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                      ColorizeAnimatedText(
                        textAlign: TextAlign.center,
                        'WHILE TRADING',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                )),
              ],
            ),
            splashIconSize: 250,
            //nextScreen: LoginScreen(),
            nextScreen: const WelcomeScreen(),
            //nextScreen: const SupplierHomeScreen(),
            // nextScreen: const CustomerHomeScreen(),
            //nextScreen: const ProductHome(),
            //nextScreen: RegistrationScreen(),
            splashTransition: SplashTransition.slideTransition,
            backgroundColor: Colors.black26),
      ),
    );
  }
}
