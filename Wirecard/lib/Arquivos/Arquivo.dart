import 'package:Wirecard/Objetos/Links.dart';

class Arquivo {
    Links links;
    String date;
    String id;
    String type;

    Arquivo({this.links, this.date, this.id, this.type});

    factory Arquivo.fromJson(Map<String, dynamic> json) {
        return Arquivo(
          links: json['links'] != null ? Links.fromJson(json['links']) : null,
            date: json['date'],
            id: json['id'],
            type: json['type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['date'] = this.date;
        data['id'] = this.id;
        data['type'] = this.type;
        if (this.links != null) {
            data['links'] = this.links.toJson();
        }
        return data;
    }
}

