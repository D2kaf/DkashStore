import 'package:flutter/material.dart';
import '../models/product.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de productos
    List<Product> products = [
      Product(
        id: 1,
        name: 'Camiseta Negra básica',
        price: 75000,
        description: 'Camiseta negra con diseño básico, perfecto para los que desean vestir de una manera casual, con corte orversize para mayor comodidad y elegancia.',
        imageUrl: 'assets/images/catalog1.png',
      ),
      // Product(
      //   id: 2,
      //   name: 'Camiseta Blanca',
      //   price: 22.99,
      //   description: 'Camiseta blanca con estilo casual.',
      //   imageUrl: 'assets/images/catalog2.png',
      // ),
      // Puedes agregar más productos aquí
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Productos'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length, // La cantidad de productos en la lista
        itemBuilder: (context, index) {
          Product product = products[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.grey[900],
            child: ListTile(
              leading: Image.asset(
                product.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
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
