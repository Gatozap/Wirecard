import 'package:Wirecard/Objetos/Line.dart';
import 'package:Wirecard/Objetos/Summary.dart';

class Extrato {
    List<Line> lines;
    Summary summary;

    Extrato({this.lines, this.summary});

    factory Extrato.fromJson(Map<String, dynamic> json) {
        return Extrato(
            lines: json['lines'] != null ? (json['lines'] as List).map((i) => Line.fromJson(i)).toList() : null,
            summary: json['summary'] != null ? Summary.fromJson(json['summary']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.lines != null) {
            data['lines'] = this.lines.map((v) => v.toJson()).toList();
        }
        if (this.summary != null) {
            data['summary'] = this.summary.toJson();
        }
        return data;
    }
}




