import 'package:flutter/material.dart';
import 'package:dkashstore/database/db_helper.dart';

class OrderListScreen extends StatefulWidget {
  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  List<Map<String, dynamic>> _orders = [];

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    final orders = await DBHelper.instance.getOrders();
    setState(() {
      _orders = orders;
    });
  }

  Future<void> _deleteOrder(int id) async {
    await DBHelper.instance.deleteOrder(id);
    _loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Órdenes'),
      ),
      body: _orders.isEmpty
          ? Center(child: Text('No hay órdenes disponibles.'))
          : ListView.builder(
              itemCount: _orders.length,
              itemBuilder: (context, index) {
                final order = _orders[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('Orden #${order['id']}'),
                    subtitle: Text('Total: \$${order['total']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        bool confirmDelete = await _showDeleteConfirmation();
                        if (confirmDelete) {
                          _deleteOrder(order['id']);
                        }
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }

  Future<bool> _showDeleteConfirmation() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Eliminar Orden'),
            content: Text('¿Seguro que deseas eliminar esta orden?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text('Eliminar', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ) ??
        false;
  }
}