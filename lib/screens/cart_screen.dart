import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _loadCartItems();
  }

  Future<void> _loadCartItems() async {
    final items = await DBHelper.instance.getCartItems();
    setState(() {
      _cartItems = items;
    });
  }

  Future<void> _removeCartItem(int id) async {
    await DBHelper.instance.deleteCartItem(id);
    _loadCartItems();
  }

  Future<void> _clearCart() async {
    await DBHelper.instance.clearCart();
    _loadCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrito de Compras')),
      body: _cartItems.isEmpty
          ? const Center(child: Text('El carrito está vacío'))
          : ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text('Cantidad: ${item['quantity']} - \$${item['price']}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeCartItem(item['id']),
                  ),
                );
              },
            ),
      bottomNavigationBar: _cartItems.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _clearCart,
                child: const Text('Vaciar Carrito'),
              ),
            )
          : null,
    );
  }
}