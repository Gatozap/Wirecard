
import 'package:Wirecard/Objetos/Adress.dart';
import 'package:Wirecard/Objetos/IdentityDocument.dart';
import 'package:Wirecard/Objetos/Phone.dart';
import 'package:Wirecard/Objetos/TaxDocument.dart';

class Person {
  Address address;
  String birthDate;
  IdentityDocument identityDocument;
  String lastName;
  String name;
  Phone phone;
  TaxDocument taxDocument;

  Person(
      {this.address,
        this.birthDate,
        this.identityDocument,
        this.lastName,
        this.name,
        this.phone,
        this.taxDocument});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      address:
      json['address'] != null ? Address.fromJson(json['address']) : null,
      birthDate: json['birthDate'],
      identityDocument: json['identityDocument'] != null
          ? IdentityDocument.fromJson(json['identityDocument'])
          : null,
      lastName: json['lastName'],
      name: json['name'],
      phone: json['phone'] != null ? Phone.fromJson(json['phone']) : null,
      taxDocument: json['taxDocument'] != null
          ? TaxDocument.fromJson(json['taxDocument'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthDate'] = this.birthDate;
    data['lastName'] = this.lastName;
    data['name'] = this.name;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.identityDocument != null) {
      data['identityDocument'] = this.identityDocument.toJson();
    }
    if (this.phone != null) {
      data['phone'] = this.phone.toJson();
    }
    if (this.taxDocument != null) {
      data['taxDocument'] = this.taxDocument.toJson();
    }
    return data;
  }
}