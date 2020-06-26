import 'package:Wirecard/Objetos/Order.dart';

class Orders {
    List<Order> orders;
    String ownId;

    Orders({this.orders, this.ownId});

    factory Orders.fromJson(Map<String, dynamic> json) {
        return Orders(
            orders: json['orders'] != null ? (json['orders'] as List).map((i) => Order.fromJson(i)).toList() : null,
            ownId: json['ownId'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['ownId'] = this.ownId;
        if (this.orders != null) {
            data['orders'] = this.orders.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

