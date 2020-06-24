

import 'package:Wirecard/Objetos/Links.dart';
import 'package:Wirecard/Objetos/Payment.dart';

class Liberacao {
    Links links;

    int amount;
    String createdAt;
    String description;
    String id;
    String status;
    String updatedAt;

    Liberacao({this.links, this.amount, this.createdAt, this.description, this.id, this.status, this.updatedAt});

    factory Liberacao.fromJson(Map<String, dynamic> json) {
        return Liberacao(
            links: json['links'] != null ? Links.fromJson(json['links']) : null,


            amount: json['amount'],
            createdAt: json['createdAt'],
            description: json['description'],
            id: json['id'],
            status: json['status'],
            updatedAt: json['updatedAt'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['amount'] = this.amount;
        data['createdAt'] = this.createdAt;
        data['description'] = this.description;
        data['id'] = this.id;
        data['status'] = this.status;
        data['updatedAt'] = this.updatedAt;


        if (this.links != null) {
            data['links'] = this.links.toJson();
        }
        return data;
    }
}


