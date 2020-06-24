import 'package:Wirecard/Objetos/InstructionLines.dart';

class Boleto {

    String statementDescriptor;
    String expirationDate;
    InstructionLines instructionLines;
    String logoUri;
    Boleto({
         this.expirationDate  ,
         this.instructionLines,
         this.logoUri         ,
        this.statementDescriptor});

    factory Boleto.fromJson(Map<String, dynamic> json) {
        return Boleto(
           statementDescriptor: json['statementDescriptor'],
            expirationDate: json['expirationDate'],
            instructionLines: json['instructionLines'] != null ? InstructionLines.fromJson(json['instructionLines']) : null,
            logoUri: json['logoUri'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['statementDescriptor'] = this.statementDescriptor;
         data['expirationDate'] = this.expirationDate;
         data['logoUri'] = this.logoUri;
        if (this.instructionLines != null) {
            data['instructionLines'] = this.instructionLines.toJson();
        }

        return data;
    }
}



