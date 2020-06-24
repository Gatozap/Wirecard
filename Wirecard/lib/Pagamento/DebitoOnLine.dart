class DebitoOnLine {

    int bankNumber;
    String expirationDate;
    DebitoOnLine({this.bankNumber, this.expirationDate});

    factory DebitoOnLine.fromJson(Map<String, dynamic> json) {
        return DebitoOnLine(
            bankNumber: json['bankNumber'],
            expirationDate: json['expirationDate'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['bankNumber'] = this.bankNumber;
        data['expirationDate'] = this.expirationDate;

        return data;
    }
}

