import 'package:Wirecard/Objetos/TransferInstrument.dart';

class Transferencia {
    int amount;
    TransferInstrument transferInstrument;

    Transferencia({this.amount, this.transferInstrument});

    factory Transferencia.fromJson(Map<String, dynamic> json) {
        return Transferencia(
            amount: json['amount'],
            transferInstrument: json['transferInstrument'] != null ? TransferInstrument.fromJson(json['transferInstrument']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['amount'] = this.amount;
        if (this.transferInstrument != null) {
            data['transferInstrument'] = this.transferInstrument.toJson();
        }
        return data;
    }
}






