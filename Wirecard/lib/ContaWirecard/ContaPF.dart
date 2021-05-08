
import 'package:Wirecard/Objetos/Adress.dart';
import 'package:Wirecard/Objetos/Email.dart';
import 'package:Wirecard/Objetos/IdentityDocument.dart';
import 'package:Wirecard/Objetos/Links.dart';
import 'package:Wirecard/Objetos/Person.dart';
import 'package:Wirecard/Objetos/Phone.dart';
import 'package:Wirecard/Objetos/TaxDocument.dart';
import 'package:flutter/material.dart';

class ContaPF {
  Links links;
  String accessToken;
  String channelId;
  String createdAt;
  Email email;

  String id;
  String login;
  Person person;
  String grant_type;
  String code;
  Phone phone;
  Address address;
  String response_type;
  String client_id;
  String redirect_uri;
  String scope;

  Map<String, dynamic> CadastrarJson() => {
        "email": {"address": email.address},
        'person': person.toJson(),
        'type': type,
          

      };
  bool transparentAccount;
  IdentityDocument identityDocument;
  String type;
  ContaPF.nova({
    @required this.person,
    @required this.email,
    @required this.type,
  });
  ContaPF(
      {this.response_type,
       this.client_id,
       this.redirect_uri,
       this.scope,
        this.links,
       this.grant_type,
       this.code,
      this.accessToken,
      this.channelId,
      this.createdAt,
      this.email,
      this.id,
      this.login,
      this.person,
      this.transparentAccount,
      this.type});

  factory ContaPF.fromJson(Map<String, dynamic> json) {
    return ContaPF(
      client_id: json['client_id'],
      redirect_uri: json['redirect_uri'],
      response_type: json['response_type'],
      scope: json['scope'],
       grant_type: json['grant_type'],
       code: json['code'],
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
      accessToken: json['accessToken'],
      channelId: json['channelId'],
      createdAt: json['createdAt'],
      email: json['email'] != null ? Email.fromJson(json['email']) : null,
      id: json['id'],
      login: json['login'],
      person: json['person'] != null ? Person.fromJson(json['person']) : null,
      transparentAccount: json['transparentAccount'],
      type: json['type'],
    );
  }

  @override
  String toString() {
    return 'ContaPF{response_type: $response_type ,redirect_uri: $redirect_uri, client_id:$client_id, scope: $scope,links: $links, accessToken: $accessToken, channelId: $channelId, createdAt: $createdAt, email: $email, id: $id, login: $login, person: $person, phone: $phone, address: $address, transparentAccount: $transparentAccount, identityDocument: $identityDocument, type: $type}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken == null ? null : this.accessToken;
    data['channelId'] = this.channelId == null ? null : this.channelId;
    data['createdAt'] = this.createdAt == null ? null : this.createdAt;
    data['id'] = this.id == null ? null : this.id;
    data['client_id'] = this.client_id == null ? null : this.client_id;
    data['redirect_uri'] = this.redirect_uri == null ? null : this.redirect_uri;
    data['response_type'] = this.response_type == null ? null : this.response_type;
    data['scope'] = this.scope == null ? null : this.scope;

     data['grant_type'] = this.grant_type == null? null : this.grant_type;
     data['code'] = this.code == null? null : this.code;

    data['login'] = this.login == null ? null : this.login;
    data['transparentAccount'] =
        this.transparentAccount == null ? null : this.transparentAccount;
    data['type'] = this.type == null ? null : this.type;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.email != null) {
      data['email'] = this.email.toJson();
    }
    if (this.person != null) {
      data['person'] = this.person.toJson();
    }
    return data;
  }
}








