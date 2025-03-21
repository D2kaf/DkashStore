import 'package:flutter/material.dart';
import '../models/product.dart';

class PaymentScreen extends StatelessWidget {
  final Product product;

  const PaymentScreen({super.key, required this.product});

  void _processPayment(BuildContext context) {
    // Simulación de pago
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pago realizado con éxito')),
    );

    // Volver a la pantalla principal después del pago
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.popUntil(context, (route) => route.isFirst);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pago')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Producto: ${product.name}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Precio: \$${product.price}', style: const TextStyle(fontSize: 18, color: Colors.green)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _processPayment(context),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Pagar Ahora'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
          ],
        ),
      ),
    );
  }
}