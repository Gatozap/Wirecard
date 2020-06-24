class Card {
  String brand;
  bool store;

  Card({this.brand, this.store});

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      brand: json['brand'],
      store: json['store'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand'] = this.brand;
    data['store'] = this.store;
    return data;
  }
}