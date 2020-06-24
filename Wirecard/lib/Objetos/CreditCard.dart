import 'package:Wirecard/Objetos/Card.dart';
import 'package:Wirecard/Objetos/Holder.dart';

class CreditCard {
    String hash;
    Card card;
    String cvc;
    String expirationMonth;
    String expirationYear;
    Holder holder;
    String number;
    String method;
    String brand;
    String first6;

    bool store;







    String id;
    String last4;


    CreditCard({ this.brand, this.first6,  this.id, this.last4, this.store,this.method,this.cvc, this.expirationMonth, this.expirationYear, this.holder, this.number,this.card, this.hash});

    factory CreditCard.fromJson(Map<String, dynamic> json) {
        return CreditCard(
            cvc: json['cvc'],
            hash: json['hash'],
            brand: json['brand'],
            first6: json['first6'],

            id: json['id'],
            last4: json['last4'],
            store: json['store'],
            expirationMonth: json['expirationMonth'],
            expirationYear: json['expirationYear'],
            holder: json['holder'] != null ? Holder.fromJson(json['holder']) : null,
            number: json['number'],
            card: json['card'] != null ? Card.fromJson(json['card']) : null,
            method: json['method'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['method'] = this.method;
        data['hash'] = this.hash;
        data['cvc'] = this.cvc;
        data['brand'] = this.brand;
        data['first6'] = this.first6;
        data['id'] = this.id;
        data['last4'] = this.last4;
        data['store'] = this.store;
        data['expirationMonth'] = this.expirationMonth;
        data['expirationYear'] = this.expirationYear;
        data['number'] = this.number;
        if (this.holder != null) {
            data['holder'] = this.holder.toJson();
        }
        if (this.card != null) {
            data['card'] = this.card.toJson();
        }

        return data;
    }
}



