import 'package:flutter/material.dart';
import 'header.dart';

class HomePage extends StatelessWidget {
  final void Function(int)? onTabChanged;

  const HomePage({super.key, this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderWidget(
            username: "Airliya Naufalita",
            email: "airliya@gmail.com",
            onFavoritePressed: () => onTabChanged?.call(1),
            onCartPressed: () => onTabChanged?.call(0),
          ),
          // Tambahan isi body di bawah header
        ],
      ),
    );
  }
}
