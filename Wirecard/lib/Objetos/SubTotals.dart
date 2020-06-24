class Subtotals {
  int shipping;

  Subtotals({this.shipping});

  factory Subtotals.fromJson(Map<String, dynamic> json) {
    return Subtotals(
      shipping: json['shipping'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shipping'] = this.shipping;
    return data;
  }
}