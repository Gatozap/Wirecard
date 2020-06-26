import 'package:Wirecard/Objetos/Links.dart';

class Line {
  Links links;
  int amount;
  String date;
  String description;
  int type;

  Line({this.links, this.amount, this.date, this.description, this.type});

  factory Line.fromJson(Map<String, dynamic> json) {
    return Line(
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
      amount: json['amount'],
      date: json['date'],
      description: json['description'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['date'] = this.date;
    data['description'] = this.description;
    data['type'] = this.type;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    return data;
  }
}