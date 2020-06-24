
import 'package:Wirecard/Objetos/Event.dart';
import 'package:Wirecard/Objetos/Fee.dart';
import 'package:Wirecard/Objetos/FundingInstrument.dart';
import 'package:Wirecard/Objetos/Links.dart';
import 'package:Wirecard/Pedido/Amount.dart';

class Payment {
  String href;
  String title;
  Links _links;
  Amount amount;
  String createdAt;
  List<Event> events;
  List<Fee> fees;
  FundingInstrument fundingInstrument;
  String id;
  int installmentCount;
  String status;
  String updatedAt;
  Payment({this.href, this.title});

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
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