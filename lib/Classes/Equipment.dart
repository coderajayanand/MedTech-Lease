class Equipment {
  final String name;
  final double rentingCost;
  final int quantity;
  final String imageUrl;

  Equipment({required this.name, required this.rentingCost, required this.quantity, required this.imageUrl});

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      name: json['name'],
      rentingCost: (json['rentingCost'] as num).toDouble(),
      quantity: json['quantity'],
      imageUrl: json['imageUrl'],
    );
  }
}
