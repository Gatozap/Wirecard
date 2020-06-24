
class IdentityDocument {
  String issueDate;
  String issuer;
  String number;
  String type;

  IdentityDocument({this.issueDate, this.issuer, this.number, this.type});

  factory IdentityDocument.fromJson(Map<String, dynamic> json) {
    return IdentityDocument(
      issueDate: json['issueDate'],
      issuer: json['issuer'],
      number: json['number'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['issueDate'] = this.issueDate;
    data['issuer'] = this.issuer;
    data['number'] = this.number;
    data['type'] = this.type;
    return data;
  }
}