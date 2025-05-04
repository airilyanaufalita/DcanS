import 'package:flutter/material.dart';
import 'header.dart';

class Minuman extends StatelessWidget {
  final void Function(int)? onTabChanged;

  const Minuman({Key? key, this.onTabChanged}) : super(key: key);

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
          const Expanded(
            child: Center(child: Text('Halaman Menu makanan ringan')),
          ),
        ],
      ),
    );
  }
}
