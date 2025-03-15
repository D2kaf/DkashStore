import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de Productos'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 10,  // Número de productos (por ahora, 10 productos de ejemplo)
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(10),
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.shopping_bag),
                title: Text('Producto ${index + 1}'),
                subtitle: Text('Descripción del producto ${index + 1}'),
                onTap: () {
                  // Navegar a la pantalla de detalle del producto
                  Navigator.pushNamed(context, '/productDetail');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
