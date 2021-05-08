
import 'package:Wirecard/Objetos/Adress.dart';
import 'package:Wirecard/Objetos/Phone.dart';
import 'package:Wirecard/Objetos/TaxDocument.dart';
import 'package:Wirecard/Objetos/mainActivity.dart';

class Compania{
  String nome;
  String razaoSocial;
  String dataDeAbertura;


  mainActivity mainactivity ;
   TaxDocument taxDocument;
   Phone      phone;
   Address address;

   

  Compania({this.nome, this.razaoSocial, this.dataDeAbertura, this.address,this.phone,this.taxDocument,this.mainactivity});


  @override
  String toString() {
    return 'Compania{nome: $nome, razaoSocial: $razaoSocial, dataDeAbertura: $dataDeAbertura, mainactivity: $mainactivity, taxDocument: $taxDocument, phone: $phone, address: $address}';
  }

  Compania.fromJson(Map<String, dynamic> json)
      : nome = json['nome'],
        razaoSocial = json['razaoSocial'],
        dataDeAbertura = json['dataDeAbertura'],
        mainactivity = json['mainactivity'],
        taxDocument = json['taxDocument'],
        phone = json['phone'],
        address = json['address'];

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'razaoSocial': razaoSocial,
        'dataDeAbertura': dataDeAbertura,
        'mainactivity': mainactivity,
        'taxDocument': taxDocument,
        'phone': phone,
        'address': address,
      };
}