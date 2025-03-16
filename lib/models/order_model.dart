class Order {
  final int? id;
  final double totalPrice;
  final DateTime date;

  Order({this.id, required this.totalPrice, required this.date});

  // Convertir Order a un Map para SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'total_price': totalPrice,
      'date': date.toIso8601String(),
    };
  }

  // Crear Order desde un Map recuperado de SQLite
  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      totalPrice: map['total_price'],
      date: DateTime.parse(map['date']),
    );
  }
}
