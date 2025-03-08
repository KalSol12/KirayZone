import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPhoneSelected = true;
  bool isPasswordVisible = false;
  bool rememberMe = false;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                "Welcome Back",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Login to access your account",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(height: 20),

              // Toggle Button for Phone / Email
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    _buildToggleButton("Phone Number", true),
                    _buildToggleButton("Email", false),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Input Field for Phone Number or Email
              TextField(
                controller: isPhoneSelected ? phoneController : emailController,
                keyboardType:
                    isPhoneSelected
                        ? TextInputType.phone
                        : TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: isPhoneSelected ? "Phone Number" : "Email",
                  hintText: isPhoneSelected ? "Phone Number" : "Email",
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                ),
              ),
              SizedBox(height: 15),

              // Password Field
              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Remember Me & Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                      ),
                      Text("Remember me"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Login Button
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
                    // Handle login logic
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // OR Sign In With
              Text("Or Sign In With", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 10),

              // Social Media Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                    ),
                    onPressed: () {
                      // Handle Google login
                    },
                    icon: Icon(
                      FontAwesomeIcons.google,
                      color: Color(0xFFDB4437),
                    ),
                    label: Text(
                      "Google",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                    ),
                    onPressed: () {
                      // Handle Facebook login
                    },
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      color: Color(0xFF1877F2),
                    ),
                    label: Text(
                      "Facebook",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.person_add,
                        size: 18,
                        color: Colors.blue,
                      ),
                      label: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
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
              isPhoneSelected = isSelected;
              // Ensure navigation only occurs when switching to the signup screen
              if (text == "Sign Up") {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder:
                        (context, animation, secondaryAnimation) =>
                            SignupScreen(),
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
                  isPhoneSelected == isSelected
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
                    isPhoneSelected == isSelected ? Colors.black : Colors.grey,
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

  // Helper: Social Media Button
  Widget _buildSocialButton(IconData icon, Color color) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Icon(icon, color: color, size: 30),
      ),
    );
  }
}
