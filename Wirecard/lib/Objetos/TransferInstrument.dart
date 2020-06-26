
import 'package:Wirecard/ContaBancaria/ContaBancaria.dart';

class TransferInstrument {
  ContaBancaria bankAccount;
  String method;

  TransferInstrument({this.bankAccount, this.method});

  factory TransferInstrument.fromJson(Map<String, dynamic> json) {
    return TransferInstrument(
      bankAccount: json['bankAccount'] != null ? ContaBancaria.fromJson(json['bankAccount']) : null,
      method: json['method'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method'] = this.method;
    if (this.bankAccount != null) {
      data['bankAccount'] = this.bankAccount.toJson();
    }
    return data;
  }
}