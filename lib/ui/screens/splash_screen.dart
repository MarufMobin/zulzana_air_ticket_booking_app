import 'package:flutter/material.dart';
import 'package:zulzana_air_travel/ui/screens/booking_screen.dart';
import 'package:zulzana_air_travel/ui/widgets/background_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BookingScreen()),
    );
  }
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        child: Center(
          child: Text(
            'Fly With the \n best fares',
            style: TextStyle(fontSize: 46, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
