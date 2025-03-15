import 'package:flutter/material.dart';
import '../models/product.dart';  // Asegúrate de tener la clase Product importada

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  // Recibimos el producto desde la pantalla anterior
  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),  // Mostramos el nombre del producto en la AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del producto
            Image.network(
              product.imageUrl,  // La URL de la imagen del producto
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            
            // Nombre del producto
            Text(
              product.name,
              style: Theme.of(context).textTheme.titleLarge,  // Usamos titleLarge en lugar de headline5
            ),
            SizedBox(height: 8),

            // Descripción del producto
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyMedium,  // bodyMedium está bien para descripción
            ),
            SizedBox(height: 16),

            // Precio del producto
            Text(
              '\$${product.price}',
              style: Theme.of(context).textTheme.titleMedium,  // Cambié headline5 por titleMedium
            ),
            SizedBox(height: 16),

            // Botón para agregar al carrito
            ElevatedButton(
              onPressed: () {
                // Lógica para agregar al carrito
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} agregado al carrito')),
                );
              },
              child: Text('Agregar al carrito'),
            ),
          ],
        ),
      ),
    );
  }
}
