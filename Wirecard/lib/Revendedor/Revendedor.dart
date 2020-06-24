

import 'Endereco.dart';

/// email : {"address":"dev.moip@labs.moip.com.br"}
/// person : {"name":"Runscope","lastName":"Random 9123","taxDocument":{"type":"CPF","number":"123.456.798-91"},"identityDocument":{"type":"RG","number":"434322344","issuer":"SSP","issueDate":"2000-12-12"},"birthDate":"1990-01-01","phone":{"countryCode":"55","areaCode":"11","number":"965213244"},"address":{"street":"Av. Brigadeiro Faria Lima","streetNumber":"2927","district":"Itaim","zipCode":"01234-000","city":"São Paulo","state":"SP","country":"BRA"}}
/// type : "MERCHANT"
/// https://sandbox.moip.com.br/v2/accounts#
class Revendedor {
  EmailBean _email;
  PersonBean _person;
  String _type;

  EmailBean get email => _email;
  PersonBean get person => _person;
  String get type => _type;

  Revendedor(this._email, this._person, this._type);

  Revendedor.map(dynamic obj) {
    this._email = obj["email"];
    this._person = obj["person"];
    this._type = obj["type"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = _email;
    map["person"] = _person;
    map["type"] = _type;
    return map;
  }

}

/// name : "Runscope"
/// lastName : "Random 9123"
/// taxDocument : {"type":"CPF","number":"123.456.798-91"}
/// identityDocument : {"type":"RG","number":"434322344","issuer":"SSP","issueDate":"2000-12-12"}
/// birthDate : "1990-01-01"
/// phone : {"countryCode":"55","areaCode":"11","number":"965213244"}
/// address : {"street":"Av. Brigadeiro Faria Lima","streetNumber":"2927","district":"Itaim","zipCode":"01234-000","city":"São Paulo","state":"SP","country":"BRA"}

class PersonBean {
  String _name;
  String _lastName;
  TaxDocumentBean _taxDocument;
  IdentityDocumentBean _identityDocument;
  String _birthDate;
  Telefone _phone;
  Endereco _address;

  String get name => _name;
  String get lastName => _lastName;
  TaxDocumentBean get taxDocument => _taxDocument;
  IdentityDocumentBean get identityDocument => _identityDocument;
  String get birthDate => _birthDate;
  Telefone get phone => _phone;
  Endereco get address => _address;

  PersonBean(this._name, this._lastName, this._taxDocument, this._identityDocument, this._birthDate, this._phone, this._address);

  PersonBean.map(dynamic obj) {
    this._name = obj["name"];
    this._lastName = obj["lastName"];
    this._taxDocument = obj["taxDocument"];
    this._identityDocument = obj["identityDocument"];
    this._birthDate = obj["birthDate"];
    this._phone = obj["phone"];
    this._address = obj["address"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["lastName"] = _lastName;
    map["taxDocument"] = _taxDocument;
    map["identityDocument"] = _identityDocument;
    map["birthDate"] = _birthDate;
    map["phone"] = _phone;
    map["address"] = _address;
    return map;
  }

}


class Telefone {
  String areaCode;
  String countryCode;
  String number;

  Telefone({this.areaCode, this.countryCode, this.number});

  factory Telefone.fromJson(Map<String, dynamic> json) {
    return Telefone(
      areaCode: json['areaCode'],
      countryCode: json['countryCode'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['areaCode'] = this.areaCode;
    data['countryCode'] = this.countryCode;
    data['number'] = this.number;
    return data;
  }
}

/// type : "RG"
/// number : "434322344"
/// issuer : "SSP"
/// issueDate : "2000-12-12"

class IdentityDocumentBean {
  String _type;
  String _number;
  String _issuer;
  String _issueDate;

  String get type => _type;
  String get number => _number;
  String get issuer => _issuer;
  String get issueDate => _issueDate;

  IdentityDocumentBean(this._type, this._number, this._issuer, this._issueDate);

  IdentityDocumentBean.map(dynamic obj) {
    this._type = obj["type"];
    this._number = obj["number"];
    this._issuer = obj["issuer"];
    this._issueDate = obj["issueDate"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["type"] = _type;
    map["number"] = _number;
    map["issuer"] = _issuer;
    map["issueDate"] = _issueDate;
    return map;
  }

}

/// type : "CPF"
/// number : "123.456.798-91"

class TaxDocumentBean {
  String _type;
  String _number;

  String get type => _type;
  String get number => _number;

  TaxDocumentBean(this._type, this._number);

  TaxDocumentBean.map(dynamic obj) {
    this._type = obj["type"];
    this._number = obj["number"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["type"] = _type;
    map["number"] = _number;
    return map;
  }

}
/// address : "dev.moip@labs.moip.com.br"

class EmailBean {
  String _address;

  String get address => _address;

  EmailBean(this._address);

  EmailBean.map(dynamic obj) {
    this._address = obj["address"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["address"] = _address;
    return map;
  }

}