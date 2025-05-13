import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'keranjang.dart';
import 'favorite.dart';
import 'home.dart';
import 'makanan_berat.dart';
import 'makanan_ringan.dart';
import 'minuman.dart';
import 'profile.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;

  const NavBar({Key? key, this.currentIndex = 2}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late NotchBottomBarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = NotchBottomBarController(index: widget.currentIndex);
  }

  void handleTabChange(int index) {
    setState(() {
      _controller.index = index;
    });
  }

  List<Widget> get _pages => [
        const KeranjangPage(),
        const FavoritePage(),
        HomePage(onTabChanged: handleTabChange),
        MakananBeratPage(onTabChanged: handleTabChange),
        const ProfilePage(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_controller.index],
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: const Color(0xFF7A9EA7),
        notchColor: const Color(0xFF7A9EA7),
        showLabel: false,
        removeMargins: true,
        bottomBarWidth: double.infinity,
        bottomBarHeight: 85,
        durationInMilliSeconds: 300,
        kBottomRadius: 12,
        kIconSize: 24.0,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(Icons.shopping_cart, color: Colors.white60),
            activeItem: Icon(Icons.shopping_cart, color: Colors.white),
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.favorite, color: Colors.white60),
            activeItem: Icon(Icons.favorite, color: Colors.white),
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.home, color: Colors.white60, size: 28),
            activeItem: Icon(Icons.home, color: Colors.white, size: 28),
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.restaurant_menu, color: Colors.white60),
            activeItem: Icon(Icons.restaurant_menu, color: Colors.white),
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.person, color: Colors.white60),
            activeItem: Icon(Icons.person, color: Colors.white),
          ),
        ],
        onTap: (index) {
          setState(() {
            _controller.index = index;
          });
        },
      ),
    );
  }
}
