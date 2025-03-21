import 'package:flutter/material.dart';
import '../models/product.dart';
import '../database/db_helper.dart';
import 'payment_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  Future<void> _addToCart(BuildContext context) async {
    final cartItem = {
      'id': product.id,
      'name': product.name,
      'price': product.price,
      'quantity': 1,
    };

    await DBHelper.instance.insertCartItem(cartItem);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Producto agregado al carrito')),
    );
  }

  void _buyNow(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.black, // AppBar negro
        foregroundColor: Colors.white, // Texto blanco en AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white, // Asegura que el fondo de la imagen sea blanco
              child: Image.asset(
                product.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.contain, // Evita que la imagen se recorte
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 5),
            Text(
              '\$${product.price}',
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 10),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _addToCart(context),
              child: const Text('Agregar al Carrito'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _buyNow(context),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Comprar Ahora'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}
