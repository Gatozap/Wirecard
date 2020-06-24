
class TaxDocument {
  String number;
  String type;

  TaxDocument({this.number, this.type});

  factory TaxDocument.fromJson(Map<String, dynamic> json) {
    return TaxDocument(
      number: json['number'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['type'] = this.type;
    return data;
  }
}