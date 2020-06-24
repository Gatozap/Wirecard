class BillingAddress {
  String city;
  String country;
  String district;
  String state;
  String street;
  String streetNumber;
  String zipCode;

  BillingAddress({this.city, this.country, this.district, this.state, this.street, this.streetNumber, this.zipCode});

  factory BillingAddress.fromJson(Map<String, dynamic> json) {
    return BillingAddress(
      city: json['city'],
      country: json['country'],
      district: json['district'],
      state: json['state'],
      street: json['street'],
      streetNumber: json['streetNumber'],
      zipCode: json['zipCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['country'] = this.country;
    data['district'] = this.district;
    data['state'] = this.state;
    data['street'] = this.street;
    data['streetNumber'] = this.streetNumber;
    data['zipCode'] = this.zipCode;
    return data;
  }
}