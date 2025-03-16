import 'package:flutter/material.dart';
import '../models/product.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Productos'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 10,
        itemBuilder: (context, index) {
          Product product = Product(
            id: index + 1,
            name: 'Producto ${index + 1}',
            price: 19.99,
            description: 'Descripción del producto ${index + 1}',
            imageUrl: 'https://via.placeholder.com/150',
          );

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.grey[900],
            child: ListTile(
              leading: Image.network(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(product.name, style: const TextStyle(color: Colors.white)),
              subtitle: Text(product.description, style: TextStyle(color: Colors.grey[400])),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/productDetail',
                  arguments: product,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
