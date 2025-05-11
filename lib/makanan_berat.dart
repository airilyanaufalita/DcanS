import 'package:flutter/material.dart';
import 'header.dart';
import 'kategori_list.dart';

class MenuPage extends StatelessWidget {
  final void Function(int)? onTabChanged;

  const MenuPage({super.key, this.onTabChanged});

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

                // Kategori dengan highlight "Makanan Berat"
                const KategoriList(selectedCategory: CategoryType.berat),

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
                      'Makanan Berat',
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

          // Grid makanan berat
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 0.8,
              children: const [
                FoodCard(image: 'assets/images/nasgor.jpg', name: 'Nasi Goreng', price: 'Rp. 7.000'),
                FoodCard(image: 'assets/images/pecel.jpg', name: 'Nasi Pecel', price: 'Rp. 7.000'),
                FoodCard(image: 'assets/images/Nasi Bakar.jpg', name: 'Nasi Bakar', price: 'Rp. 9.000'),
              ],
            ),
          ),
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
