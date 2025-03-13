import 'package:book_app/navigation/screens.dart';
import 'package:book_app/ui/splash/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  double _titlePosition = 100; // Start position (off-screen)

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _titlePosition = 350; // Move under the logo
      });
    });

    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        GoRouter.of(context).pushReplacement(BottomNavigationScreen.home.route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/book_logo.png", // Replace with your logo
                  width: 250,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SlidingText(slidingAnimationPosition: _titlePosition,)
        ],
      ),
    );
  }
}