import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isSignupSelected = true;
  bool isPasswordVisible = false;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                "Get Started Now",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Create an account or log in to explore about our app",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(height: 20),

              // Toggle Button for Sign Up / Log In
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    _buildToggleButton("Sign Up", true),
                    _buildToggleButton("Log In", false),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Input Fields
              _buildTextField("First Name", firstNameController),
              _buildTextField("Last Name", lastNameController),
              _buildTextField("Email", emailController),
              _buildTextField(
                "Birth Date",
                birthDateController,
                Icons.calendar_today,
              ),
              _buildTextField("Password", passwordController, Icons.lock, true),
              _buildTextField(
                "Confirm Password",
                confirmPasswordController,
                Icons.lock,
                true,
              ),
              SizedBox(height: 20),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent.shade400,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Handle sign up logic
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return Expanded(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            setState(() {
              isSignupSelected = isSelected;
              if (!isSelected) {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder:
                        (context, animation, secondaryAnimation) =>
                            LoginScreen(),
                    transitionsBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ) {
                      const begin = 0.0;
                      const end = 1.0;
                      const curve = Curves.easeInOut;

                      var tween = Tween(
                        begin: begin,
                        end: end,
                      ).chain(CurveTween(curve: curve));
                      var fadeAnimation = animation.drive(tween);

                      return FadeTransition(
                        opacity: fadeAnimation,
                        child: child,
                      );
                    },
                  ),
                );
              }
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color:
                  isSignupSelected == isSelected
                      ? Colors.lightGreenAccent.shade400
                      : Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              style: TextStyle(
                color:
                    isSignupSelected == isSelected ? Colors.black : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, [
    IconData? icon,
    bool isPassword = false,
  ]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword && !isPasswordVisible,
        decoration: InputDecoration(
          labelText: label,
          hintText: label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          suffixIcon:
              icon != null
                  ? IconButton(
                    icon: Icon(icon),
                    onPressed:
                        isPassword
                            ? () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            }
                            : null,
                  )
                  : null,
        ),
      ),
    );
  }
}
