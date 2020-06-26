import 'package:Wirecard/Objetos/Links.dart';

class Antecipacao {
    Links links;
    String executedAt;
    String externalId;
    int grossAmount;
    int liquidAmount;
    String moipAccount;
    int percentageFee;
    int requestAmount;
    String requestedAt;
    String status;
    int totalFee;
    String updatedAt;

    Antecipacao({this.links, this.executedAt, this.externalId, this.grossAmount, this.liquidAmount, this.moipAccount, this.percentageFee, this.requestAmount, this.requestedAt, this.status, this.totalFee, this.updatedAt});

    factory Antecipacao.fromJson(Map<String, dynamic> json) {
        return Antecipacao(
          links: json['links'] != null ? Links.fromJson(json['links']) : null,
            executedAt: json['executedAt'],
            externalId: json['externalId'],
            grossAmount: json['grossAmount'],
            liquidAmount: json['liquidAmount'],
            moipAccount: json['moipAccount'],
            percentageFee: json['percentageFee'],
            requestAmount: json['requestAmount'],
            requestedAt: json['requestedAt'],
            status: json['status'],
            totalFee: json['totalFee'],
            updatedAt: json['updatedAt'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['executedAt'] = this.executedAt;
        data['externalId'] = this.externalId;
        data['grossAmount'] = this.grossAmount;
        data['liquidAmount'] = this.liquidAmount;
        data['moipAccount'] = this.moipAccount;
        data['percentageFee'] = this.percentageFee;
        data['requestAmount'] = this.requestAmount;
        data['requestedAt'] = this.requestedAt;
        data['status'] = this.status;
        data['totalFee'] = this.totalFee;
        data['updatedAt'] = this.updatedAt;
        if (this.links != null) {
            data['links'] = this.links.toJson();
        }
        return data;
    }
}
