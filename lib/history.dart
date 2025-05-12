import 'package:flutter/material.dart';
import 'profile.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header with back button and title
          Container(
            color: const Color(0xFF7A9EA7),
            padding: const EdgeInsets.only(top: 50.0, bottom: 30.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        'Order History',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Wave-like header bottom
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 30,
              color: const Color(0xFF7A9EA7),
            ),
          ),
          
          // Order list
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
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

// Custom clipper for the wave effect
class WaveClipper extends CustomClipper<Path> {
  const WaveClipper();

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      0,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Order item widget for each order in history
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
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Food image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, _, __) => Container(
                width: 80,
                height: 80,
                color: Colors.grey[300],
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          const SizedBox(width: 12),
          
          // Order details
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
                  quantity.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Rp. ${price.toString()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          
          // Buy again button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7A9EA7),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text('Beli Lagi'),
          ),
        ],
      ),
    );
  }
}

// Main screen to demonstrate the OrderHistoryScreen
class OrderHistoryApp extends StatelessWidget {
  const OrderHistoryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF7A9EA7),
        fontFamily: 'Roboto',
      ),
      home: const HistoryPage(),
    );
  }
}

void main() {
  runApp(const OrderHistoryApp());
}