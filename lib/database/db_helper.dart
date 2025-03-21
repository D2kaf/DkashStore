import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'dkash_store.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Crear tabla de productos
        await db.execute('''
          CREATE TABLE products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            price REAL NOT NULL,
            imageUrl TEXT NOT NULL
          )
        ''');

        // Crear tabla del carrito
        await db.execute('''
          CREATE TABLE cart (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            price REAL NOT NULL,
            quantity INTEGER NOT NULL
          )
        ''');

        // Crear tabla de pedidos
        await db.execute('''
          CREATE TABLE orders (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            total REAL NOT NULL,
            date TEXT NOT NULL
          )
        ''');

        // Crear tabla de items dentro de pedidos
        await db.execute('''
          CREATE TABLE order_items (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            order_id INTEGER NOT NULL,
            name TEXT NOT NULL,
            price REAL NOT NULL,
            quantity INTEGER NOT NULL,
            FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE
          )
        ''');
      },
    );
  }

  // Métodos para gestionar productos
  Future<int> insertProduct(Map<String, dynamic> product) async {
    final db = await database;
    return await db.insert('products', product, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await database;
    return await db.query('products');
  }

  Future<int> deleteProduct(int id) async {
    final db = await database;
    return await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  // Métodos para gestionar el carrito
  Future<int> insertCartItem(Map<String, dynamic> cartItem) async {
    final db = await database;
    return await db.insert('cart', cartItem, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getCartItems() async {
    final db = await database;
    return await db.query('cart');
  }

  Future<int> updateCartItem(int id, int quantity) async {
    final db = await database;
    return await db.update(
      'cart',
      {'quantity': quantity},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteCartItem(int id) async {
    final db = await database;
    return await db.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> clearCart() async {
    final db = await database;
    return await db.delete('cart');
  }

  // Métodos para gestionar pedidos
  Future<int> insertOrder(Map<String, dynamic> order) async {
    final db = await database;
    return await db.insert('orders', order, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getOrders() async {
    final db = await database;
    return await db.query('orders');
  }

  Future<int> deleteOrder(int id) async {
    final db = await database;
    return await db.delete('orders', where: 'id = ?', whereArgs: [id]);
  }

  // Métodos para gestionar items de pedidos
  Future<int> insertOrderItem(Map<String, dynamic> orderItem) async {
    final db = await database;
    return await db.insert('order_items', orderItem, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getOrderItems(int orderId) async {
    final db = await database;
    try {
      return await db.query('order_items', where: 'order_id = ?', whereArgs: [orderId]);
    } catch (e) {
      print('Error obteniendo items del pedido: $e');
      return [];
    }
  }
}