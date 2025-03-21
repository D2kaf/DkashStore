import 'package:flutter/material.dart';

class ProductCatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de Productos'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navegar a la pantalla de detalle del producto
            Navigator.pushNamed(context, '/product-detail');
          },
          child: Text('Ir al detalle del producto'),
        ),
      ),
    );
  }
}