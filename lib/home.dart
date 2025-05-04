import 'package:flutter/material.dart';
import 'header.dart';
import 'makanan berat.dart'; // Tambahkan import ini

class HomePage extends StatelessWidget {
  final void Function(int)? onTabChanged;

  const HomePage({super.key, this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(
                  username: "Airliya Naufalita",
                  email: "airliya@gmail.com",
                  onFavoritePressed: () => onTabChanged?.call(1),
                  onCartPressed: () => onTabChanged?.call(0),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    children: [
                      CategoryCard(
                        image: 'assets/images/t.berat.jpg',
                        label: 'Makanan Berat',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MenuPage()),
                          );
                        },
                      ),
                      const SizedBox(width: 25),
                      const CategoryCard(image: 'assets/images/t.ringan.jpg', label: 'Makanan Ringan'),
                      const SizedBox(width: 30),
                      const CategoryCard(image: 'assets/images/t.minuman.jpg', label: 'Minuman'),
                    ],
                  ),
                ),
                const SizedBox(height: 26),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8CAEC9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'popular',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 26),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 0.8,
              children: const [
                FoodCard(image: 'assets/images/Roti & Pisang Bakar.jpg', name: 'Roti Bakar', price: 'Rp. 2.000'),
                FoodCard(image: 'assets/images/nasgor.jpg', name: 'Nasi Goreng', price: 'Rp. 7.000'),
                FoodCard(image: 'assets/images/pecel.jpg', name: 'Nasi Pecel', price: 'Rp. 7.000'),
                FoodCard(image: 'assets/images/Nasi Bakar.jpg', name: 'Nasi Bakar', price: 'Rp. 9.000'),
                FoodCard(image: 'assets/images/martabak.jpg', name: 'Martabak', price: 'Rp. 6.000'),
                FoodCard(image: 'assets/images/milkshake oreo.jpg', name: 'Milkshake Oreo', price: 'Rp. 8.000'),
              ],
            ),
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

  const CategoryCard({
    super.key,
    required this.image,
    required this.label,
    this.onTap,
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
              border: Border.all(color: Colors.blue.shade200, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(image, width: 90, height: 90, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const FoodCard({super.key, required this.image, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
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
            child: Image.asset(image, height: 120, width: double.infinity, fit: BoxFit.cover),
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
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.favorite_border, size: 20, color: Colors.white),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: const Icon(Icons.add, size: 20, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
