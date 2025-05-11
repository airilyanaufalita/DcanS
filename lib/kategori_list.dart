import 'package:flutter/material.dart';
import 'makanan_berat.dart';
import 'makanan_ringan.dart';
import 'minuman.dart';

enum CategoryType { berat, ringan, minuman }

class KategoriList extends StatelessWidget {
  final CategoryType selectedCategory;
  final void Function(int)? onTabChanged;

  const KategoriList({super.key, required this.selectedCategory, this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        children: [
          CategoryCard(
            image: 'assets/images/t.berat.jpg',
            label: 'Makanan Berat',
            isSelected: selectedCategory == CategoryType.berat,
            onTap: () {
              if (selectedCategory != CategoryType.berat) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPage(onTabChanged: onTabChanged)),
                );
              }
            },
          ),
          const SizedBox(width: 25),
          CategoryCard(
            image: 'assets/images/t.ringan.jpg',
            label: 'Makanan Ringan',
            isSelected: selectedCategory == CategoryType.ringan,
            onTap: () {
              if (selectedCategory != CategoryType.ringan) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Menuringan(onTabChanged: onTabChanged)),
                );
              }
            },
          ),
          const SizedBox(width: 30),
          CategoryCard(
            image: 'assets/images/t.minuman.jpg',
            label: 'Minuman',
            isSelected: selectedCategory == CategoryType.minuman,
            onTap: () {
              if (selectedCategory != CategoryType.minuman) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Minuman(onTabChanged: onTabChanged)),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback? onTap;
  final bool isSelected;

  const CategoryCard({
    super.key,
    required this.image,
    required this.label,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.blue.shade200,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(image, width: 90, height: 90, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
