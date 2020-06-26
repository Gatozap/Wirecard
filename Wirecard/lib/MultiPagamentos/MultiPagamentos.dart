

import 'package:Wirecard/Objetos/FundingInstrument.dart';
import 'package:Wirecard/Objetos/Links.dart';
import 'package:Wirecard/Objetos/Payment.dart';
import 'package:Wirecard/Pedido/Amount.dart';

class MultiPagamentos {
  Links links;
  Amount amount;
  String id;
  List<Payment> payments;
  String status;


  FundingInstrument fundingInstrument;
    int installmentCount;
      String multiorder_id;
      String multipayment_id;
  MultiPagamentos({
       this.links,
       this.amount,
       this.id,
       this.payments,
       this.status,
       this.multiorder_id,
       this.multipayment_id,
      this.fundingInstrument, this.installmentCount});

    factory MultiPagamentos.fromJson(Map<String, dynamic> json) {
        return MultiPagamentos(
             links:    json['links'] != null ? Links.fromJson(json['links']) : null,
             amount:   json['amount'] != null ? Amount.fromJson(json['Amount']): null,
             id:       json['id'],
          payments: json['payments'] != null ? (json['payments'] as List).map((i) => Payment.fromJson(i)).toList() : null,
          status:   json['status'],
            multiorder_id:   json['multiorder_id'],
            multipayment_id:json['multipayment_id'],
            fundingInstrument: json['fundingInstrument'] != null ? FundingInstrument.fromJson(json['fundingInstrument']) : null,
            installmentCount: json['installmentCount'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['installmentCount'] = this.installmentCount;

         data['multiorder_id'] = this.multiorder_id;
         data['multipayment_id'] = this.multipayment_id;
        if (this.links != null) {
          data['links'] = this.links.toJson();
        }
        if (this.payments != null) {
          data['payments'] = this.payments.map((v) => v.toJson()).toList();
        }
        if (this.amount != null) {
          data['amount'] = this.amount.toJson();
        }
        if (this.fundingInstrument != null) {
            data['fundingInstrument'] = this.fundingInstrument.toJson();
        }
        data['id'] = this.id;

        data['status'] = this.status;
        return data;
    }
}









