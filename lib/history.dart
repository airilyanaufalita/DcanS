import 'package:flutter/material.dart';
import 'profile.dart';
import 'makanan_berat.dart'; // Import halaman tujuan

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF7A9EA7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            padding: const EdgeInsets.only(top: 70.0, bottom: 50.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    'Order History',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // List Riwayat Pesanan
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 15),
              children: const [
                OrderItem(
                  date: '12-2-25',
                  foodName: 'Mie Ayam',
                  quantity: 3,
                  price: 21000,
                  imagePath: 'assets/images/mie ayam.jpg',
                ),
                OrderItem(
                  date: '15-2-25',
                  foodName: 'Nasi Goreng',
                  quantity: 1,
                  price: 7000,
                  imagePath: 'assets/images/nasgor.jpg',
                ),
                OrderItem(
                  date: '20-2-25',
                  foodName: 'Es Milo',
                  quantity: 3,
                  price: 12000,
                  imagePath: 'assets/images/milkshake oreo.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final String date;
  final String foodName;
  final int quantity;
  final int price;
  final String imagePath;

  const OrderItem({
    Key? key,
    required this.date,
    required this.foodName,
    required this.quantity,
    required this.price,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color(0xFFE5EBED),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          // Gambar Makanan
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (context, _, __) => Container(
                width: 70,
                height: 70,
                color: Colors.grey[300],
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Detail Pesanan
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  foodName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Rp. $price',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Tombol "Beli Lagi"
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MakananBeratPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7A9EA7),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              minimumSize: const Size(70, 30),
            ),
            child: const Text(
              'Beli Lagi',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
