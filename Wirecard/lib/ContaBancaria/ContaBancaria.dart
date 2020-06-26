import 'package:Wirecard/Objetos/Holder.dart';

class ContaBancaria {
    String accountCheckNumber;
    String accountNumber;
    String agencyCheckNumber;
    String agencyNumber;
    String bankNumber;
    Holder holder;
    String type;

    ContaBancaria({this.accountCheckNumber, this.accountNumber, this.agencyCheckNumber, this.agencyNumber, this.bankNumber, this.holder, this.type});

    factory ContaBancaria.fromJson(Map<String, dynamic> json) {
        return ContaBancaria(
            accountCheckNumber: json['accountCheckNumber'],
            accountNumber: json['accountNumber'],
            agencyCheckNumber: json['agencyCheckNumber'],
            agencyNumber: json['agencyNumber'],
            bankNumber: json['bankNumber'],
            holder: json['holder'] != null ? Holder.fromJson(json['holder']) : null,
            type: json['type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['accountCheckNumber'] = this.accountCheckNumber;
        data['accountNumber'] = this.accountNumber;
        data['agencyCheckNumber'] = this.agencyCheckNumber;
        data['agencyNumber'] = this.agencyNumber;
        data['bankNumber'] = this.bankNumber;
        data['type'] = this.type;
        if (this.holder != null) {
            data['holder'] = this.holder.toJson();
        }
        return data;
    }
}



