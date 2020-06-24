
class Customer {
  String id;

  Customer({this.id});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}