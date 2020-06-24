import 'package:Wirecard/Objetos/Links.dart';
import 'package:Wirecard/Objetos/Phone.dart';
import 'package:Wirecard/Objetos/ShippingAddress.dart';
import 'package:Wirecard/Objetos/TaxDocument.dart';

class Cliente {

    String customer_id;
    String birthDate;
    String email;
    String fullname;
    String ownId;
    Phone phone;
    ShippingAddress shippingAddress;
    TaxDocument taxDocument;
    Links  links;
    String createdAt;
    String id;





    Cliente({
         this.links,
         this.createdAt,
         this.id,
        this.customer_id,
        this.birthDate, this.email, this.fullname, this.ownId, this.phone, this.shippingAddress, this.taxDocument});

    factory Cliente.fromJson(Map<String, dynamic> json) {
        return Cliente(
            links: json['links'],
            createdAt: json['createdAt'],
            id: json['id'],
            customer_id: json['customer_id'],
            birthDate: json['birthDate'],
            email: json['email'],
            fullname: json['fullname'],
            ownId: json['ownId'],
            phone: json['phone'] != null ? Phone.fromJson(json['phone']) : null,
            shippingAddress: json['shippingAddress'] != null ? ShippingAddress.fromJson(json['shippingAddress']) : null,
            taxDocument: json['taxDocument'] != null ? TaxDocument.fromJson(json['taxDocument']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['birthDate'] = this.birthDate;
        data['links'] = this.links;
        data['createdAt'] = this.createdAt;
        data['id'] = this.id;
        data['customer_id'] = this.customer_id;
        data['email'] = this.email;
        data['fullname'] = this.fullname;
        data['ownId'] = this.ownId;
        if (this.phone != null) {
            data['phone'] = this.phone.toJson();
        }
        if (this.shippingAddress != null) {
            data['shippingAddress'] = this.shippingAddress.toJson();
        }
        if (this.taxDocument != null) {
            data['taxDocument'] = this.taxDocument.toJson();
        }
        return data;
    }
}








