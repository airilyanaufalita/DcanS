import 'package:flutter/material.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keranjang")),
      body: const Center(
        child: Text('Halaman Keranjang'),
      ),
    );
  }
}
