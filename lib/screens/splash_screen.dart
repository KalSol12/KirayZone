import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _loadingProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _simulateAppLoading();
  }

  Future<void> _simulateAppLoading() async {
    const duration = Duration(seconds: 30);
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _loadingProgress += 0.03;
      });
      if (_loadingProgress >= 1.0) {
        timer.cancel();
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    });
    await Future.delayed(duration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/house1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: _loadingProgress == 1.0 ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Image.asset(
                  'assets/images/house1.jpg',
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Your Trusted Rental Service',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              LinearProgressIndicator(
                value: _loadingProgress,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
