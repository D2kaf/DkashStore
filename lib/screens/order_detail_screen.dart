import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class OrderDetailScreen extends StatefulWidget {
  final int orderId;

  const OrderDetailScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  List<Map<String, dynamic>> _orderItems = [];

  @override
  void initState() {
    super.initState();
    _loadOrderItems();
  }

  Future<void> _loadOrderItems() async {
    try {
      final items = await DBHelper.instance.getOrderItems(widget.orderId);
      setState(() {
        _orderItems = items;
      });
    } catch (e) {
      print('Error obteniendo detalles del pedido: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Pedido'),
      ),
      body: _orderItems.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _orderItems.length,
              itemBuilder: (context, index) {
                final item = _orderItems[index];
                return Card(
                  child: ListTile(
                    title: Text(item['name']),
                    subtitle: Text('Cantidad: ${item['quantity']}'),
                    trailing: Text('\$${item['price'] * item['quantity']}'),
                  ),
                );
              },
            ),
    );
  }
}