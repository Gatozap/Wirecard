
class Order {
  String href;
  String title;

  Order({this.href, this.title});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      href: json['href'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    data['title'] = this.title;
    return data;
  }
}