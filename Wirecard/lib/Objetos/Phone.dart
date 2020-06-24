class Phone {
  String areaCode;
  String countryCode;
  String number;

  Phone({this.areaCode, this.countryCode, this.number});

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
      areaCode: json['areaCode'],
      countryCode: json['countryCode'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['areaCode'] = this.areaCode;
    data['countryCode'] = this.countryCode;
    data['number'] = this.number;
    return data;
  }
}