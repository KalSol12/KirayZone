import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final List<Map<String, String>> onboardingData = [
    {
      "title": "Find Your Dream Property",
      "description":
          "Browse through the best properties available in your area.",
      "image":
          "https://media.istockphoto.com/id/1436217023/photo/exterior-of-a-blue-suburban-home.jpg?s=1024x1024&w=is&k=20&c=AZKMyi9tKbOYS5lNCNvRxOfahxo__p_s-Lb8JTXVvqY=",
    },
    {
      "title": "Easy & Secure Transactions",
      "description": "Make hassle-free payments with secure options.",
      "image":
          "https://images.pexels.com/photos/164686/pexels-photo-164686.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    },
    {
      "title": "Get Started Today!",
      "description": "Sign up and start exploring properties now.",
      "image":
          "https://images.pexels.com/photos/3643925/pexels-photo-3643925.jpeg?auto=compress&cs=tinysrgb&w=600",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages:
          onboardingData.map((data) {
            return PageViewModel(
              title: data["title"]!,
              body: data["description"]!,
              image: buildImage(data["image"]!),
              decoration: pageDecoration(),
            );
          }).toList(),
      onDone: () {
        Navigator.pushReplacementNamed(context, '/login');
      },
      onSkip: () {
        Navigator.pushReplacementNamed(context, '/login');
      },
      showSkipButton: true,
      skip: Text("Skip", style: TextStyle(fontSize: 16)),
      next: Text("Next", style: TextStyle(fontSize: 16, color: Colors.blue)),
      done: Text("Get Started", style: TextStyle(fontWeight: FontWeight.bold)),
      dotsDecorator: DotsDecorator(
        size: Size(8.0, 8.0),
        color: Colors.grey,
        activeSize: Size(16.0, 8.0),
        activeColor: Colors.blue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }

  Widget buildImage(String url) {
    return Center(
      child: Image.network(
        url,
        height: 350,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.error, size: 100, color: Colors.red);
        },
      ),
    );
  }

  PageDecoration pageDecoration() {
    return PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 16),
      imagePadding: EdgeInsets.all(20),
    );
  }
}
