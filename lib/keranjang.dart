import 'package:flutter/material.dart';
import 'header.dart';
import 'order.dart';

class KeranjangPage extends StatefulWidget {
  final void Function(int)? onTabChanged;

  const KeranjangPage({Key? key, this.onTabChanged}) : super(key: key);

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  final List<FoodItem> foodItems = [
    FoodItem(name: 'Nasi Goreng', price: 7000, image: 'assets/images/nasgor.jpg', isSelected: true),
    FoodItem(name: 'Takoyaki', price: 5000, image: 'assets/images/takoyaki.jpg', isSelected: true),
    FoodItem(name: 'Tahu Walik', price: 2000, image: 'assets/images/tahu walik.jpg', isSelected: false),
    FoodItem(name: 'Kue Soes', price: 3000, image: 'assets/images/kue soes.jpg', isSelected: false),
    FoodItem(name: 'Nasi Bakar', price: 8000, image: 'assets/images/Nasi Bakar.jpg', isSelected: false),
  ];

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
            child: Container(
              color: Colors.grey.shade50,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 8, bottom: 80),
                      itemCount: foodItems.length,
                      itemBuilder: (context, index) {
                        return CartItemCard(
                          foodItem: foodItems[index],
                          onQuantityChanged: (quantity) {
                            setState(() {
                              foodItems[index].quantity = quantity;
                            });
                          },
                          onSelectionChanged: (isSelected) {
                            setState(() {
                              foodItems[index].isSelected = isSelected;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to order page with selected items
                          final selectedItems = foodItems.where((item) => item.isSelected).toList();
                          if (selectedItems.isNotEmpty) {
                            // Calculate total price
                            int totalPrice = 0;
                            for (var item in selectedItems) {
                              totalPrice += item.price * item.quantity;
                            }
                            
                            // Convert FoodItem to OrderItem
                            final orderItems = selectedItems.map((item) => 
                              OrderItem(
                                name: item.name,
                                price: item.price,
                                image: item.image,
                                quantity: item.quantity,
                              )
                            ).toList();
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderPage(
                                  items: orderItems,
                                  totalPrice: totalPrice,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please select at least one item')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2B6777),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Order',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
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
}

class FoodItem {
  final String name;
  final int price;
  final String image;
  bool isSelected;
  int quantity;

  FoodItem({
    required this.name,
    required this.price,
    required this.image,
    this.isSelected = false,
    this.quantity = 1,
  });
}

class CartItemCard extends StatelessWidget {
  final FoodItem foodItem;
  final Function(int) onQuantityChanged;
  final Function(bool) onSelectionChanged;

  const CartItemCard({
    Key? key,
    required this.foodItem,
    required this.onQuantityChanged,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Main content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    foodItem.image,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 70,
                        height: 70,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.restaurant, color: Colors.grey),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 22),
                // Food details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodItem.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Rp. ${foodItem.price}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Quantity controls
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: foodItem.quantity > 1
                            ? () => onQuantityChanged(foodItem.quantity - 1)
                            : null,
                        icon: const Icon(Icons.remove_circle_outline),
                        color: const Color(0xFF2B6777),
                        iconSize: 20,
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          '${foodItem.quantity}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => onQuantityChanged(foodItem.quantity + 1),
                        icon: const Icon(Icons.add_circle_outline),
                        color: const Color(0xFF2B6777),
                        iconSize: 20,
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Checkbox in top right corner
          Positioned(
            top: 1,
            right: 4,
            child: SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: foodItem.isSelected,
                onChanged: (value) => onSelectionChanged(value ?? false),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                activeColor: const Color(0xFF2B6777),
                side: BorderSide(color: Colors.grey.shade400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}