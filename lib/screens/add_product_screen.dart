import 'package:flutter/material.dart';
import 'package:dkashstore/database/db_helper.dart';
import 'package:dkashstore/models/product.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  Future<void> _addProduct() async {
    final String name = _nameController.text;
    final String description = _descriptionController.text;
    final double price = double.tryParse(_priceController.text) ?? 0.0;
    final String imageUrl = _imageUrlController.text;

    if (name.isEmpty || description.isEmpty || price <= 0 || imageUrl.isEmpty) {
      // Validar campos vacíos o incorrectos
      return;
    }

    // Crear una instancia de Product
    final product = Product(
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
    );

    // Insertar el producto en la base de datos
    await DBHelper.instance.insertProduct(product);

    // Volver atrás a la pantalla anterior
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre del producto'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'URL de la imagen'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addProduct,
              child: Text('Agregar Producto'),
            ),
          ],
        ),
      ),
    );
  }
}
