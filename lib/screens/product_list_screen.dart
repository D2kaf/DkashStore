import 'package:flutter/material.dart';
import 'package:dkashstore/screens/product_detail_screen.dart';  // Importa la pantalla de detalle
import '../models/product.dart';  // Asegúrate de tener el modelo de producto

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 1,
      name: 'Camiseta Básica',
      description: 'Camiseta de algodón de alta calidad.',
      price: 19.99,
      imageUrl: 'https://via.placeholder.com/150',  // URL de la imagen
    ),
    // Aquí puedes agregar más productos
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          final product = products[index];
          return ListTile(
            contentPadding: EdgeInsets.all(8),
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            onTap: () {
              // Navegar a la pantalla de detalles del producto
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ProductDetailScreen(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
