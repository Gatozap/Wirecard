

import 'package:Wirecard/Objetos/Device.dart';
import 'package:Wirecard/Objetos/FundingInstrument.dart';



class Pagamento {
    Device device;
    FundingInstrument fundingInstrument;
    int installmentCount;
    String statementDescriptor;
    

    Pagamento({this.device, this.fundingInstrument, this.installmentCount, this.statementDescriptor});

    factory Pagamento.fromJson(Map<String, dynamic> json) {
        return Pagamento(
            device: json['device'] != null ? Device.fromJson(json['device']) : null,
            fundingInstrument: json['fundingInstrument'] != null ? FundingInstrument.fromJson(json['fundingInstrument']) : null,
            installmentCount: json['installmentCount'],
            statementDescriptor: json['statementDescriptor'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['installmentCount'] = this.installmentCount;
        data['statementDescriptor'] = this.statementDescriptor;
        if (this.device != null) {
            data['device'] = this.device.toJson();
        }
        if (this.fundingInstrument != null) {
            data['fundingInstrument'] = this.fundingInstrument.toJson();
        }
        return data;
    }
}








