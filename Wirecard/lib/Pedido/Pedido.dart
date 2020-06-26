import 'package:Wirecard/Objetos/Customer.dart';
import 'package:Wirecard/Objetos/Item.dart';
import 'package:Wirecard/Objetos/Receiver.dart';
import 'package:Wirecard/Pedido/Amount.dart';

class Pedido {
    Amount amount;
    Customer customer;
    List<Item> items;
    String ownId;
    List<Receiver> receivers;

    Pedido({this.amount, this.customer, this.items, this.ownId, this.receivers});

    factory Pedido.fromJson(Map<String, dynamic> json) {
        return Pedido(
            amount: json['amount'] != null ? Amount.fromJson(json['amount']) : null,
            customer: json['customer'] != null ? Customer.fromJson(json['customer']) : null,
            items: json['items'] != null ? (json['items'] as List).map((i) => Item.fromJson(i)).toList() : null,
            ownId: json['ownId'],
            receivers: json['receivers'] != null ? (json['receivers'] as List).map((i) => Receiver.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['ownId'] = this.ownId;
        if (this.amount != null) {
            data['amount'] = this.amount.toJson();
        }
        if (this.customer != null) {
            data['customer'] = this.customer.toJson();
        }
        if (this.items != null) {
            data['items'] = this.items.map((v) => v.toJson()).toList();
        }
        if (this.receivers != null) {
            data['receivers'] = this.receivers.map((v) => v.toJson()).toList();
        }
        return data;
    }
}








