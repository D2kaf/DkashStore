import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../models/product.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  Future<void> _addProduct() async {
    final String name = nameController.text.trim();
    final String priceText = priceController.text.trim();
    final String description = descriptionController.text.trim();
    final String imageUrl = imageUrlController.text.trim();

    if (name.isEmpty || priceText.isEmpty || description.isEmpty || imageUrl.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Todos los campos son obligatorios')),
      );
      return;
    }

    final double? price = double.tryParse(priceText);
    if (price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Precio inválido')),
      );
      return;
    }

    final product = Product(
      name: name,
      price: price,
      description: description,
      imageUrl: imageUrl,
    );

    await DBHelper.instance.insertProduct(product.toMap());

    if (mounted) {
      Navigator.pop(context, true); // Regresar a la pantalla anterior
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Producto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: 'URL de Imagen'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addProduct,
              child: const Text('Guardar Producto'),
            ),
          ],
        ),
      ),
    );
  }
}
