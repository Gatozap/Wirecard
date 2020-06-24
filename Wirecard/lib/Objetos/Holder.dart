
import 'package:Wirecard/Objetos/BillingAddress.dart';
import 'package:Wirecard/Objetos/Card.dart';

import 'package:Wirecard/Objetos/Phone.dart';
import 'package:Wirecard/Objetos/TaxDocument.dart';
import 'package:Wirecard/Pagamento/Pagamento.dart';

class Holder {
  String birthdate;
  String fullname;
  Phone phone;
  TaxDocument taxDocument;
  BillingAddress billingAddress;

  Holder({this.birthdate, this.fullname, this.phone, this.taxDocument, this.billingAddress});

  factory Holder.fromJson(Map<String, dynamic> json) {
    return Holder(
      birthdate: json['birthdate'],
      fullname: json['fullname'],
        billingAddress: json['billingAddress'],
      phone: json['phone'] != null ? Phone.fromJson(json['phone']) : null,
      taxDocument: json['taxDocument'] != null ? TaxDocument.fromJson(json['taxDocument']) : null,
    );
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthdate'] = this.birthdate;
    data['fullname'] = this.fullname;
    if (this.billingAddress != null){
      data['billingAddress'] = this.billingAddress.toJson();
    }
    if (this.phone != null) {
      data['phone'] = this.phone.toJson();
    }
    if (this.taxDocument != null) {
      data['taxDocument'] = this.taxDocument.toJson();
    }
    return data;
  }


}




