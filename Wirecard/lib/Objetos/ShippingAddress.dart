class ShippingAddress {
  String city;
  String complement;
  String country;
  String district;
  String state;
  String street;
  String streetNumber;
  String zipCode;

  ShippingAddress({this.city, this.complement, this.country, this.district, this.state, this.street, this.streetNumber, this.zipCode});




  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      city: json['city'],
      complement: json['complement'],
      country: json['country'],
      district: json['district'],
      state: json['state'],
      street: json['street'],
      streetNumber: json['streetNumber'],
      zipCode: json['zipCode'],
    );

  } Map<String, dynamic> toJson() => {
    'city': city,
    'complement': complement,
    'country': country,
    'district': district,
    'state': state,
    'street': street,
    'streetNumber': streetNumber,
    'zipCode': zipCode,
  };


}