
class Item {
  String category;
  String detail;
  int price;
  String product;
  int quantity;

  Item({this.category, this.detail, this.price, this.product, this.quantity});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      category: json['category'],
      detail: json['detail'],
      price: json['price'],
      product: json['product'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['detail'] = this.detail;
    data['price'] = this.price;
    data['product'] = this.product;
    data['quantity'] = this.quantity;
    return data;
  }
}