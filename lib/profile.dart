import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Profile header with curved background
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF7AA1AB), // Teal-blue background color
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Profile picture with edit icon
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                            image: const DecorationImage(
                              image: AssetImage('assets/profile_picture.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), // Increased spacing
                    // User name
                    const Text(
                      'Airilya Naufalita',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8), // Added spacing
                    // User email
                    const Text(
                      'airilya@gmail.com',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20), // Added spacing
                  ],
                ),
              ),
            ),
          ),
          // Profile menu options
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 20), // Added top padding
              children: [
                _buildMenuItem(
                  context,
                  Icons.edit_outlined,
                  'EDIT PROFILE',
                  onTap: () {},
                ),
                _buildMenuItem(
                  context,
                  Icons.favorite_outline,
                  'MY FAVORITE',
                  onTap: () {},
                ),
                _buildMenuItem(
                  context,
                  Icons.calendar_today_outlined,
                  'ORDER HISTORY',
                  onTap: () {},
                ),
                _buildMenuItem(
                  context,
                  Icons.key_outlined,
                  'RESET PASSWORD',
                  onTap: () {},
                ),
                const SizedBox(height: 20), // Added spacing before logout
                _buildMenuItem(
                  context,
                  Icons.logout_outlined,
                  'LOG OUT',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, 
    IconData icon, 
    String title, 
    {required VoidCallback onTap}
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18), // Increased vertical padding
              child: Row(
                children: [
                  Icon(icon, size: 24, color: Colors.black54),
                  const SizedBox(width: 20), // Increased spacing
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.chevron_right,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
          ],
        ),
      ),
    );
  }
}