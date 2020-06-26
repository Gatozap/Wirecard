
import 'package:Wirecard/Objetos/Phone.dart';
import 'package:Wirecard/Objetos/ShippingAddress.dart';
import 'package:Wirecard/Objetos/TaxDocument.dart';

class Customer {
  String id;
  String birthDate;
  String email;
  String fullname;
  String ownId;
  Phone phone;
  ShippingAddress shippingAddress;
  TaxDocument taxDocument;
  Customer({this.id,this.birthDate, this.email, this.fullname, this.ownId, this.phone, this.shippingAddress, this.taxDocument});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      birthDate: json['birthDate'],
      email: json['email'],
      fullname: json['fullname'],
      ownId: json['ownId'],
      phone: json['phone'] != null ? Phone.fromJson(json['phone']) : null,
      shippingAddress: json['shippingAddress'] != null ? ShippingAddress.fromJson(json['shippingAddress']) : null,
      taxDocument: json['taxDocument'] != null ? TaxDocument.fromJson(json['taxDocument']) : null,

      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['birthDate'] = this.birthDate;
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['ownId'] = this.ownId;
    if (this.phone != null) {
      data['phone'] = this.phone.toJson();
    }
    if (this.shippingAddress != null) {
      data['shippingAddress'] = this.shippingAddress.toJson();
    }
    if (this.taxDocument != null) {
      data['taxDocument'] = this.taxDocument.toJson();
    }
    return data;
  }
}