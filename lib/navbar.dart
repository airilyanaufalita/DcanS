import 'package:flutter/material.dart';
import 'package:flutter_pertama/makanan%20ringan.dart';
import 'package:flutter_pertama/minuman.dart';
import 'home.dart';
import 'keranjang.dart';
import 'favorite.dart';
import 'profile.dart';
import 'makanan berat.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedTab = 2;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const KeranjangPage(),
      const FavoritePage(),
      HomePage(onTabChanged: _changeTab),
      const MenuPage(),
      const Menuringan(),
      const Minuman(),
      const ProfilePage(),
    ];
  }

  void _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedTab],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _changeTab(2),
        backgroundColor: _selectedTab == 2 ? const Color(0xFF7A9EA7) : Colors.grey.shade300,
        shape: const CircleBorder(),
        child: const Icon(Icons.home, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: const Color(0xFF7A9EA7),
        elevation: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTabItem(icon: Icons.shopping_cart, index: 0),
              _buildTabItem(icon: Icons.favorite, index: 1),
              const SizedBox(width: 40),
              _buildTabItem(icon: Icons.restaurant_menu, index: 3),
              _buildTabItem(icon: Icons.person, index: 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem({required IconData icon, required int index}) {
    return IconButton(
      icon: Icon(
        icon,
        color: _selectedTab == index ? Colors.white : Colors.white70,
      ),
      onPressed: () => _changeTab(index),
    );
  }
}
