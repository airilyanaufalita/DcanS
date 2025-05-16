import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'register.dart';
import 'forgot_password.dart';
import 'navbar.dart';
import 'home.dart';
import 'keranjang.dart';
import 'favorite.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', 
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        '/keranjang': (context) => const KeranjangPage(),
        '/favorite': (context) => const FavoritePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/navbar': (context) => const NavBar(),
        '/forgot_password': (context) => const ForgotPasswordPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color(0xFF7A9EA7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Column(
              children: <Widget>[
                SizedBox(height: screenHeight * 0.04),
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: CircleAvatar(
                    radius: isSmallScreen ? screenWidth * 0.15 : 70,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/kantin.png',
                        width: isSmallScreen ? screenWidth * 0.25 : 100,
                        height: isSmallScreen ? screenWidth * 0.25 : 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.08,
                        vertical: screenHeight * 0.05,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "SIGN IN",
                            style: TextStyle(
                              fontSize: isSmallScreen ? 24 : 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.04),
                          buildInputLabel("Email", isSmallScreen),
                          buildTextField(isSmallScreen, false, emailController),
                          buildInputLabel("Password", isSmallScreen),
                          buildTextField(isSmallScreen, true, passwordController),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/forgot_password');
                              },
                              child: Text(
                                "forgot password",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: isSmallScreen ? 11 : 12,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Container(
                            width: isSmallScreen ? screenWidth * 0.5 : 200,
                            height: isSmallScreen ? 45 : 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color.fromARGB(255, 108, 116, 118),
                            ),
                            child: TextButton(
                              onPressed: () {
                                String email = emailController.text.trim();
                                String password = passwordController.text;

                                if (email.isEmpty || password.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Email dan Password tidak boleh kosong")),
                                  );
                                  return;
                                }

                                Navigator.pushReplacementNamed(context, '/navbar');
                              },
                              child: Text(
                                "SIGN IN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: isSmallScreen ? 14 : 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Row(
                            children: [
                              const Expanded(child: Divider(thickness: 1)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "or login with",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: isSmallScreen ? 12 : 14,
                                  ),
                                ),
                              ),
                              const Expanded(child: Divider(thickness: 1)),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _socialButton(icon: Icons.facebook, size: isSmallScreen ? 45 : 50),
                              _socialButton(icon: Icons.g_mobiledata, size: isSmallScreen ? 45 : 50),
                              _socialButton(icon: Icons.apple, size: isSmallScreen ? 45 : 50),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have account? ",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: isSmallScreen ? 13 : 14,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: isSmallScreen ? 13 : 14,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

Widget buildInputLabel(String label, bool isSmallScreen) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(bottom: 5),
    child: Text(
      label,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: isSmallScreen ? 14 : 16,
      ),
    ),
  );
}

  Widget buildTextField(bool isSmallScreen, bool isPassword, TextEditingController controller) {
    return Container(
      height: isSmallScreen ? 45 : 50,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _socialButton({required IconData icon, required double size}) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.black, size: size * 0.5),
    );
  }
}
