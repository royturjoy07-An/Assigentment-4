import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logreg extends StatefulWidget {
  const Logreg({super.key});

  @override
  State<Logreg> createState() => _LogregState();
}

class _LogregState extends State<Logreg> {
  bool isLogin = true;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final emailRegex = RegExp(r'^cse_\d{16}@lu\.ac\.com$', caseSensitive: false);

  final passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9\s]).{8,}$',
  );

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Portal',
          style: GoogleFonts.lobster(fontSize: 25, color: Colors.white),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.yellow[900],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.yellow[900]!,
              Colors.yellow[700]!,
              Colors.yellow[500]!,
              Colors.yellow[300]!,
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isLogin ? 'LOGIN' : 'REGISTER',
                    style: GoogleFonts.lobster(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    isLogin
                        ? 'Welcome to the Student Portal'
                        : 'Create your Student Portal account',
                    style: GoogleFonts.lobster(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 25,
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                if (!isLogin)
                                  buildTextField(
                                    'Student Name',
                                    false,
                                    controller: nameController,
                                  ),
                                buildTextField(
                                  'Student Email',
                                  false,
                                  controller: emailController,
                                ),
                                buildTextField(
                                  'Password',
                                  true,
                                  controller: passwordController,
                                ),
                                if (!isLogin)
                                  buildTextField(
                                    'Confirm Password',
                                    true,
                                    controller: confirmPasswordController,
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          if (isLogin)
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          const SizedBox(height: 25),
                          GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Validation Successful!'),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.yellow[600],
                              ),
                              child: Center(
                                child: Text(
                                  isLogin ? 'Login' : 'Register',
                                  style: GoogleFonts.lobster(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                isLogin
                                    ? "Don't have an account?"
                                    : "Already have an account?",
                                style: const TextStyle(color: Colors.grey),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isLogin = !isLogin;
                                    formKey.currentState?.reset();
                                  });
                                },
                                child: Text(
                                  isLogin ? 'Register' : 'Login',
                                  style: TextStyle(
                                    color: Colors.yellow[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
    String hint,
    bool isPassword, {
    TextEditingController? controller,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$hint is required';
          }

          if (hint == 'Student Email') {
            if (!emailRegex.hasMatch(value.trim())) {
              return 'Enter a valid university email';
            }
          }

          if (hint == 'Password' && !isLogin) {
            if (!passwordRegex.hasMatch(value)) {
              return 'Use 8+ characters with uppercase, lowercase and special character';
            }
          }

          if (hint == 'Confirm Password') {
            if (value != passwordController.text) {
              return 'Passwords do not match';
            }
          }

          return null;
        },
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          errorMaxLines: 2,
        ),
      ),
    );
  }
}
