import 'package:Wirecard/Objetos/CreditCard.dart';
import 'package:Wirecard/Pagamento/Boleto.dart';
import 'package:Wirecard/Pagamento/DebitoOnLine.dart';

class FundingInstrument {
  CreditCard creditCard;
  String method;
  Boleto boleto;
  DebitoOnLine debitoOnLine;
  FundingInstrument({
       this.boleto,
       this.debitoOnLine,
    this.creditCard, this.method});

  factory FundingInstrument.fromJson(Map<String, dynamic> json) {
    return FundingInstrument(
      boleto: json['boleto'] != null ? Boleto.fromJson(json['boleto']): null,
       debitoOnLine: json['debitoOnLine'] !=null ? DebitoOnLine.fromJson(json['debitoOnLine']): null,
      creditCard: json['creditCard'] != null ? CreditCard.fromJson(json['creditCard']) : null,
      method: json['method'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method'] = this.method;
    if (this.creditCard != null) {
      data['creditCard'] = this.creditCard.toJson();
    }
    return data;
  }
}