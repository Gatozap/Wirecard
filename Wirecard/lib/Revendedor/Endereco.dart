/// street : "Av. Brigadeiro Faria Lima"
/// streetNumber : "2927"
/// district : "Itaim"
/// zipCode : "01234-000"
/// city : "São Paulo"
/// state : "SP"
/// country : "BRA"

class Endereco {
  String _street;
  String _streetNumber;
  String _district;
  String _zipCode;
  String _city;
  String _state;
  String _country;

  String get street => _street;
  String get streetNumber => _streetNumber;
  String get district => _district;
  String get zipCode => _zipCode;
  String get city => _city;
  String get state => _state;
  String get country => _country;

  Endereco(this._street, this._streetNumber, this._district, this._zipCode, this._city, this._state, this._country);

  Endereco.map(dynamic obj) {
    this._street = obj["street"];
    this._streetNumber = obj["streetNumber"];
    this._district = obj["district"];
    this._zipCode = obj["zipCode"];
    this._city = obj["city"];
    this._state = obj["state"];
    this._country = obj["country"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["street"] = _street;
    map["streetNumber"] = _streetNumber;
    map["district"] = _district;
    map["zipCode"] = _zipCode;
    map["city"] = _city;
    map["state"] = _state;
    map["country"] = _country;
    return map;
  }

}