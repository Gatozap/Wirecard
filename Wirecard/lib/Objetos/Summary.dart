class Summary {
  int creditSum;
  int debitSum;

  Summary({this.creditSum, this.debitSum});

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      creditSum: json['creditSum'],
      debitSum: json['debitSum'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creditSum'] = this.creditSum;
    data['debitSum'] = this.debitSum;
    return data;
  }
}