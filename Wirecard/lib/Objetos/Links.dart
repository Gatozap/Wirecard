
import 'package:Wirecard/Objetos/HostedAccount.dart';
import 'package:Wirecard/Objetos/Multiorder.dart';
import 'package:Wirecard/Objetos/Order.dart';
import 'package:Wirecard/Objetos/Payment.dart';
import 'package:Wirecard/Objetos/Self.dart';


class Links {
  HostedAccount hostedAccount;
  Self self;
  Multiorder multiorder;
  Payment payment;
  Order order;
  String file;
  Links({this.hostedAccount,this.payment, this.self, this.order,this.multiorder,this.file});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      file: json['file'],
      payment:   json['payment'] != null ? Payment.fromJson(json['payment']) : null,
      multiorder: json['multiorder'] != null ? Multiorder.fromJson(json['multiorder']) : null,
      order: json['order'] != null ? Order.fromJson(json['order']) : null,
      hostedAccount: json['hostedAccount'] != null ? HostedAccount.fromJson(json['hostedAccount']) : null,
      self: json['self'] != null ? Self.fromJson(json['self']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.multiorder != null) {
      data['multiorder'] = this.multiorder.toJson();
    }
    data['file'] = this.file;
    if (this.hostedAccount != null) {
      data['hostedAccount'] = this.hostedAccount.toJson();
    }
    if (this.order != null) {
      data['order'] = this.order.toJson();
    }
    if (this.payment != null) {
      data['payment'] = this.payment.toJson();
    }
    if (this.self != null) {
      data['self'] = this.self.toJson();
    }
    return data;
  }
}