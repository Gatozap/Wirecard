
import 'package:Wirecard/Objetos/SubTotals.dart';
import 'package:Wirecard/Pedido/Pedido.dart';



class Amount {
  String currency;
  int fees;
  int liquid;
  int refunds;
  int total;
  int fixed;


  Subtotals subtotals;
  Amount({this.currency, this.fees, this.liquid, this.refunds, this.total, this.fixed,  this.subtotals});

  factory Amount.fromJson(Map<String, dynamic> json) {
    return Amount(
      fixed: json['fixed'],
      currency: json['currency'],
      fees: json['fees'],
      liquid: json['liquid'],
      refunds: json['refunds'],
      total: json['total'],
      subtotals: json['subtotals'] != null ? Subtotals.fromJson(json['subtotals']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['fees'] = this.fees;
    data['fixed'] = this.fixed;
    data['liquid'] = this.liquid;
    data['refunds'] = this.refunds;
    data['total'] = this.total;
    if (this.subtotals != null) {
      data['subtotals'] = this.subtotals.toJson();
    }
    return data;
  }
}



