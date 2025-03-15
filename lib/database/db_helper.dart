import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dkashstore/models/product.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;

  // Constructor privado para evitar la creación de más instancias
  DBHelper._init();

  // Inicializar la base de datos
  Future<Database> get database async {
    if (_database != null) return _database!;

    // Si la base de datos no existe, crea una nueva
    _database = await _initDB();
    return _database!;
  }

  // Crear la base de datos
  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'products.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          '''CREATE TABLE products(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            description TEXT,
            price REAL,
            imageUrl TEXT
          )''',
        );
      },
    );
  }

  // Insertar un nuevo producto
  Future<void> insertProduct(Product product) async {
    final db = await database;
    await db.insert(
      'products',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Obtener todos los productos
  Future<List<Product>> getProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');

    return List.generate(maps.length, (i) {
      return Product.fromMap(maps[i]);
    });
  }

  // Eliminar un producto por ID
  Future<void> deleteProduct(int id) async {
    final db = await database;
    await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
