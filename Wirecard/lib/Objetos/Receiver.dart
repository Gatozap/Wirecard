import 'package:Wirecard/Objetos/MoipAccount.dart';
import 'package:Wirecard/Pedido/Amount.dart';


class Receiver {
  Amount amount;
  bool feePayor;
  MoipAccount moipAccount;
  String type;

  Receiver({this.amount, this.feePayor, this.moipAccount, this.type});

  factory Receiver.fromJson(Map<String, dynamic> json) {
    return Receiver(
      amount: json['amount'] != null ? Amount.fromJson(json['amount']) : null,
      feePayor: json['feePayor'],
      moipAccount: json['moipAccount'] != null ? MoipAccount.fromJson(json['moipAccount']) : null,
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feePayor'] = this.feePayor;
    data['type'] = this.type;
    if (this.amount != null) {
      data['amount'] = this.amount.toJson();
    }
    if (this.moipAccount != null) {
      data['moipAccount'] = this.moipAccount.toJson();
    }
    return data;
  }
}