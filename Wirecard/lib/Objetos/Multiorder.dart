
class Multiorder {
  String href;

  Multiorder({this.href});

  factory Multiorder.fromJson(Map<String, dynamic> json) {
    return Multiorder(
      href: json['href'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}