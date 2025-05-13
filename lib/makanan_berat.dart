import 'package:flutter/material.dart';
import 'header.dart';
import 'kategori_list.dart';
import 'makanan_berat.dart';
import 'makanan_ringan.dart';
import 'minuman.dart';

class MakananBeratPage extends StatefulWidget {
  final void Function(int)? onTabChanged;

  const MakananBeratPage({Key? key, this.onTabChanged}) : super(key: key);

  @override
  _MakananBeratPageState createState() => _MakananBeratPageState();
}

class _MakananBeratPageState extends State<MakananBeratPage> {
  void _navigateToCategory(String category) {
    switch (category) {
      case 'Makanan Berat':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MakananBeratPage(
              onTabChanged: widget.onTabChanged,
            ),
          ),
        );
        break;
      case 'Makanan Ringan':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MakananRinganPage(
              onTabChanged: widget.onTabChanged,
            ),
          ),
        );
        break;
      case 'Minuman':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MinumanPage(
              onTabChanged: widget.onTabChanged,
            ),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderWidget(
            username: "Airliya Naufalita",
            email: "airliya@gmail.com",
            onFavoritePressed: () => widget.onTabChanged?.call(1),
            onCartPressed: () => widget.onTabChanged?.call(0),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Buttons with Images
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildCategoryItems(),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  
                  // Popular Section Title with Background
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7699A4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Makanan Berat',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  // Popular Items Grid
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: _popularItems.map((item) => _buildFoodItem(item)).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCategoryItems() {
    return [
      _buildCategoryItemWithImage('Makanan Berat', 'assets/images/t.berat.jpg'),
      _buildCategoryItemWithImage('Makanan Ringan', 'assets/images/t.ringan.jpg'),
      _buildCategoryItemWithImage('Minuman', 'assets/images/minuman.jpg'),
    ];
  }

  Widget _buildCategoryItemWithImage(String category, String imagePath) {
    return GestureDetector(
      onTap: () => _navigateToCategory(category),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 9),
            Center(
              child: Column(
                children: [
                  Text(
                    category,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // Tambahkan garis hanya untuk kategori "Makanan Berat"
                  if (category == 'Makanan Berat')
                    Container(
                      margin: const EdgeInsets.only(top: 3),
                      height: 2,
                      width: 80,
                      color: const Color(0xFF33606E),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodItem(FoodItem item) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF33606E),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(item.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                     color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  item.price,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                       color: Colors.white,
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                    IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: () {},
                       color: Colors.white,
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
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

  // List of popular items
  static final List<FoodItem> _popularItems = [
    FoodItem(
      name: 'Nasi Kuning', 
      price: 'Rp. 7000', 
      imagePath: 'assets/images/nasi kuning.jpg',
    ),
    FoodItem(
      name: 'Nasi Goreng', 
      price: 'Rp. 7000', 
      imagePath: 'assets/images/nasgor.jpg',
    ),
    FoodItem(
      name: 'Nasi Pecel', 
      price: 'Rp. 7000', 
      imagePath: 'assets/images/pecel.jpg',
    ),
    FoodItem(
      name: 'Nasi Bakar', 
      price: 'Rp. 9000', 
      imagePath: 'assets/images/Nasi Bakar.jpg',
    ),
  ];
}