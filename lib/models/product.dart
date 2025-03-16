class Product {
  final int? id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  // Método para convertir de Mapa a Product
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'], // Verifica que 'id' existe en la base de datos
      name: map['name'] ?? '',
      price: (map['price'] as num).toDouble(), // Asegura que sea double
      description: map['description'] ?? '',
      imageUrl: map['image_url'] ?? '',
    );
  }

  // Método para convertir de Product a Mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'image_url': imageUrl,
    };
  }
}
