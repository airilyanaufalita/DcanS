import 'package:flutter/material.dart';
import 'main.dart'; // Ganti dengan path yang sesuai ke main.dart

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7A9EA7),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenHeight = constraints.maxHeight;
            final screenWidth = constraints.maxWidth;
            final isSmallScreen = screenWidth < 600;

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: screenHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),

                      // Logo kantin
                      Center(
                        child: CircleAvatar(
                          radius: isSmallScreen ? 70 : 90,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/kantin.png',
                              width: isSmallScreen ? 110 : 130,
                              height: isSmallScreen ? 110 : 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Container putih dengan form
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(80),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.08,
                              vertical: 30,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Back to login
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.arrow_back, size: 18),
                                      SizedBox(width: 5),
                                      Text("Back to Login"),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 25),

                                Center(
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 24 : 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 30),

                                // Form input
                                _buildInput("Email"),
                                _buildInput("Password", isPassword: true),
                                _buildInput("Confirm Password", isPassword: true),
                                _buildInput("Phone Number"),

                                const SizedBox(height: 25),

                                // Tombol SIGN UP
                                Center(
                                  child: Container(
                                    width: isSmallScreen ? screenWidth * 0.5 : 200,
                                    height: isSmallScreen ? 45 : 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: const Color.fromARGB(255, 108, 116, 118),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        // Navigasi ke main.dart
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const LoginPage(), // Ganti dengan nama halamanmu
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "SIGN UP",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: isSmallScreen ? 14 : 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Widget bantu untuk input form
  Widget _buildInput(String label, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 6),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 123, 113, 113)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              obscureText: isPassword,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
