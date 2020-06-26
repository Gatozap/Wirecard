import 'package:Wirecard/Objetos/Customer.dart';
import 'package:Wirecard/Objetos/Item.dart';
import 'package:Wirecard/Objetos/MoipAccount.dart';
import 'package:Wirecard/Objetos/Order.dart';
import 'package:Wirecard/Objetos/Phone.dart';
import 'package:Wirecard/Objetos/Receiver.dart';
import 'package:Wirecard/Objetos/ShippingAddress.dart';
import 'package:Wirecard/Objetos/SubTotals.dart';
import 'package:Wirecard/Objetos/TaxDocument.dart';
import 'package:Wirecard/Pedido/Amount.dart';


class MultiPedidos {
    List<Order> orders;
    String ownId;
    Customer customer;
    Amount amount;
    ShippingAddress shippingAddress;
    TaxDocument taxDocument;
    Phone phone;
    Item item;
    MoipAccount moipAccount;
    Receiver receiver;
    Subtotals subtotals;
    MultiPedidos({this.orders, this.ownId, this.customer, this.amount, this.shippingAddress, this.moipAccount, this.receiver, this.subtotals,this.item,this.phone,this.taxDocument});

    factory MultiPedidos.fromJson(Map<String, dynamic> json) {
        return MultiPedidos(
                shippingAddress:  json['shippingAddress'] != null? ShippingAddress.fromJson(json['shippingAddress']): null,
                 phone: json['phone'] != null? Phone.fromJson(json['phone']): null ,
                   item: json['item'] != null? Item.fromJson(json['item']): null ,
            moipAccount: json['moipAccount'] != null? MoipAccount.fromJson(json['moipAccount']): null ,
            receiver: json['receiver'] != null? Receiver.fromJson(json['receiver']): null ,
            subtotals: json['subtotals'] != null? Subtotals.fromJson(json['subtotals']): null ,
            taxDocument: json['taxDocument'] != null? TaxDocument.fromJson(json['taxDocument']): null ,
            customer: json['customer'] != null ? Customer.fromJson(json['customer']): null,
          amount: json['amount'] != null ? Amount.fromJson(json['Amount']): null,
            orders: json['orders'] != null ? (json['orders'] as List).map((i) => Order.fromJson(i)).toList() : null,
            ownId: json['ownId'],
        );
    }
    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();






        data['ownId'] = this.ownId;
        if (this.receiver != null) {
          data['receiver'] = this.receiver.toJson();
        }
        if (this.item != null) {
          data['item'] = this.item.toJson();
        }
        if (this.moipAccount != null) {
          data['moipAccount'] = this.moipAccount.toJson();
        }
        if (this.taxDocument != null) {
          data['taxDocument'] = this.taxDocument.toJson();
        }
        if (this.subtotals != null) {
          data['subtotals'] = this.subtotals.toJson();
        }
        if (this.phone != null) {
          data['phone'] = this.phone.toJson();
        }
        if (this.shippingAddress != null) {
          data['shippingAddress'] = this.shippingAddress.toJson();
        }
        if (this.amount != null) {
          data['amount'] = this.amount.toJson();
        }
        if (this.customer != null) {
          data['customer'] = this.customer.toJson();
        }
        if (this.orders != null) {
            data['orders'] = this.orders.map((v) => v.toJson()).toList();
        }
        return data;
    }
}










