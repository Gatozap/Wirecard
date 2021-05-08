
import 'package:Wirecard/ContaWirecard/Compania.dart';
import 'package:Wirecard/ContaWirecard/TosAcceptance.dart';
import 'package:Wirecard/Objetos/Adress.dart';
import 'package:Wirecard/Objetos/BusinessSegment.dart';


import 'package:Wirecard/Objetos/Email.dart';
import 'package:Wirecard/Objetos/TaxDocument.dart';
import 'package:Wirecard/Objetos/IdentityDocument.dart';
import 'package:Wirecard/Objetos/Person.dart';
import 'package:Wirecard/Objetos/Phone.dart';

class ContaPJ {
    Email email;
    Person person;
    String type;
    IdentityDocument identityDocument;
    Phone phone;
    Address address;
    Compania compania;
    TaxDocument taxDocument;
     String site;
      TosAcceptance tosAcceptance;
        BusinessSegment businessSegment;
        
    ContaPJ( {
      this.email,
      this.businessSegment,
      this.person,
      this.type,
      this.identityDocument,
      this.phone,
      this.address,
      this.compania,
      this.taxDocument,
      this.site,
      this.tosAcceptance});

    factory ContaPJ.fromJson(Map<String, dynamic> json) {
      return ContaPJ(
        email: json['email'],
          businessSegment: json['businessSegment']!= null ? BusinessSegment.fromJson(json['businessSegment']) : null,
        person: json['person'] != null ? Person.fromJson(json['person']) : null,
        type: json['type'],
        identityDocument: json['identityDocument'] != null ? IdentityDocument.fromJson(json['identityDocument']) : null,
        phone: json['phone'] != null ? Phone.fromJson(json['phone']) : null,
        address: json['address']!= null ? Address.fromJson(json['address']) : null,
        compania: json['compania'] != null ? Compania.fromJson(json['compania']) : null,
        taxDocument: json['taxDocument'] != null ? TaxDocument.fromJson(json['taxDocument']) : null,
        site: json['site'],
        tosAcceptance: json['tosAcceptance']!= null ? TosAcceptance.fromJson(json['tosAcceptance']) : null,

      );
    }


    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['email'] = this.email == null ? null : this.email;
      data['businessSegment'] = this.businessSegment == null? null :this.businessSegment;
      if (this.person != null) {
        data['person'] = this.person.toJson();
      }
      if (this.businessSegment != null) {
        data['businessSegment'] = this.businessSegment.toJson();
      }
      if (this.address != null) {
        data['address'] = this.address.toJson();
      }
      data['type'] = this.type == null ? null : this.type;

      if (this.phone != null) {
        data['phone'] = this.phone.toJson();
      }
      if (this.compania != null) {
        data['compania'] = this.compania.toJson();
      }
      if (this.identityDocument != null) {
        data['identityDocument'] = this.identityDocument.toJson();
      }
      if (this.taxDocument != null) {
        data['taxDocument'] = this.taxDocument.toJson();
      }


      if (this.tosAcceptance != null) {
        data['tosAcceptance'] = this.tosAcceptance.toJson();
      }

      data['site'] = this.site == null ? null : this.site;

      return data;
    }

    @override
  String toString() {
    return 'ContaPJ{email: $email, person: $person, type: $type, identityDocument: $identityDocument, phone: $phone, address: $address, compania: $compania, taxDocument: $taxDocument, site: $site, tosAcceptance: $tosAcceptance}';
  }
}


