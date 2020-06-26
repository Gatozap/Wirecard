
import 'package:Wirecard/Objetos/Event.dart';
import 'package:Wirecard/Objetos/Fee.dart';
import 'package:Wirecard/Objetos/FundingInstrument.dart';
import 'package:Wirecard/Objetos/Links.dart';
import 'package:Wirecard/Pedido/Amount.dart';

class Payment {
  List<Event> events;
  List<Fee> fees;
  String href;
  String title;

  Links links;
  bool delayCapture;
  Amount amount;
  String createdAt;
  FundingInstrument fundingInstrument;
  String id;
  int installmentCount;
  String status;
  String updatedAt;
  Payment({this.href,this.status, this.title, this.amount,this.events,this.id,this.createdAt,this.delayCapture,this.fees,this.fundingInstrument,this.installmentCount,this.links,this.updatedAt});

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(




      id: json['id'],
      links: json['links'] != null? Links.fromJson(json['links']): null ,
      delayCapture: json['delayCapture'], fundingInstrument: json['fundingInstrument'] != null ? FundingInstrument.fromJson(json['fundingInstrument']): null, updatedAt: json['updatedAt'],
      installmentCount: json['installmentCount'],amount: json['amount'] != null? Amount.fromJson(json['amount']): null,
      status: json['status'],
        createdAt: json['createdAt'],
      events: json['events'] != null ? (json['events'] as List).map((i) => Event.fromJson(i)).toList() : null,
      fees: json['fees'] != null ? (json['fees'] as List).map((i) => Fee.fromJson(i)).toList() : null,
      href: json['href'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    data['delayCapture'] = this.delayCapture;

    if (this.amount != null) {
      data['amount'] = this.amount.toJson();
    }
    data['createdAt']  = this.createdAt;
    if (this.fundingInstrument != null) {
      data['fundingInstrument'] = this.fundingInstrument.toJson();
    }

    data['installmentCount']  = this.installmentCount;
    data['status']  = this.status;
    data['updatedAt']  = this.updatedAt;
    data['href'] = this.href;
    data['title'] = this.title;
    if (this.fees != null) {
      data['fees'] = this.fees.map((v) => v.toJson()).toList();
    }
    if (this.events != null) {
      data['events'] = this.events.map((v) => v.toJson()).toList();
    }
    return data;
  }
}