class Fee {
  int amount;
  String type;

  Fee({this.amount, this.type});

  factory Fee.fromJson(Map<String, dynamic> json) {
    return Fee(
      amount: json['amount'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['type'] = this.type;
    return data;
  }
}