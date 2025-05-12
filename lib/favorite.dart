import 'package:flutter/material.dart';
import 'header.dart';

class FavoritePage extends StatelessWidget {
  final void Function(int)? onTabChanged;

  const FavoritePage({Key? key, this.onTabChanged}) : super(key: key);

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.8,
                children: [
                  _buildFavoriteItem(
                    name: "Bakso",
                    price: "Rp. 9.000",
                    imagePath: "assets/images/bakso.jpg",
                  ),
                  _buildFavoriteItem(
                    name: "Es Oreo",
                    price: "Rp. 4.000",
                    imagePath: "assets/images/milkshake oreo.jpg",
                  ),
                  _buildFavoriteItem(
                    name: "Takoyaki",
                    price: "Rp. 5.000",
                    imagePath: "assets/images/takoyaki.jpg",
                  ),
                  _buildFavoriteItem(
                    name: "Donut",
                    price: "Rp. 7.000",
                    imagePath: "assets/images/donut.jpg",
                  ),
                  _buildFavoriteItem(
                    name: "Risoles",
                    price: "Rp. 3.000",
                    imagePath: "assets/images/Risoles.jpg",
                  ),
                  _buildFavoriteItem(
                    name: "Ayam Geprek",
                    price: "Rp. 7.000",
                    imagePath: "assets/images/ayam geprek.jpg",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteItem({
    required String name,
    required String price,
    required String imagePath,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF286F8C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: const Icon(Icons.favorite, size: 25, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                // Heart icon removed from bottom section
              ],
            ),
          ),
        ],
      ),
    );
  }
}