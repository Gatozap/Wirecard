/// name : "Empresa Moip"
/// businessName : "Moip Pagamentos"
/// openingDate : "2011-01-01"
/// taxDocument : {"type":"CNPJ","number":"11.698.147/0001-13"}
/// mainActivity : {"cnae":"82.91-1/00","description":"Atividades de cobranças e informações cadastrais"}
/// phone : {"countryCode":"55","areaCode":"11","number":"32234455"}
/// address : {"street":"Av. Brigadeiro Faria Lima","streetNumber":"2927","district":"Itaim","zipCode":"01234-000","city":"São Paulo","state":"SP","country":"BRA"}

class Empresa {
  String _name;
  String _businessName;
  String _openingDate;
  TaxDocumentBean _taxDocument;
  MainActivityBean _mainActivity;
  PhoneBean _phone;
  AddressBean _address;

  String get name => _name;
  String get businessName => _businessName;
  String get openingDate => _openingDate;
  TaxDocumentBean get taxDocument => _taxDocument;
  MainActivityBean get mainActivity => _mainActivity;
  PhoneBean get phone => _phone;
  AddressBean get address => _address;

  Empresa(this._name, this._businessName, this._openingDate, this._taxDocument, this._mainActivity, this._phone, this._address);

  Empresa.map(dynamic obj) {
    this._name = obj["name"];
    this._businessName = obj["businessName"];
    this._openingDate = obj["openingDate"];
    this._taxDocument = obj["taxDocument"];
    this._mainActivity = obj["mainActivity"];
    this._phone = obj["phone"];
    this._address = obj["address"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["businessName"] = _businessName;
    map["openingDate"] = _openingDate;
    map["taxDocument"] = _taxDocument;
    map["mainActivity"] = _mainActivity;
    map["phone"] = _phone;
    map["address"] = _address;
    return map;
  }

}

/// street : "Av. Brigadeiro Faria Lima"
/// streetNumber : "2927"
/// district : "Itaim"
/// zipCode : "01234-000"
/// city : "São Paulo"
/// state : "SP"
/// country : "BRA"

class AddressBean {
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

  AddressBean(this._street, this._streetNumber, this._district, this._zipCode, this._city, this._state, this._country);

  AddressBean.map(dynamic obj) {
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

/// countryCode : "55"
/// areaCode : "11"
/// number : "32234455"

class PhoneBean {
  String _countryCode;
  String _areaCode;
  String _number;

  String get countryCode => _countryCode;
  String get areaCode => _areaCode;
  String get number => _number;

  PhoneBean(this._countryCode, this._areaCode, this._number);

  PhoneBean.map(dynamic obj) {
    this._countryCode = obj["countryCode"];
    this._areaCode = obj["areaCode"];
    this._number = obj["number"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["countryCode"] = _countryCode;
    map["areaCode"] = _areaCode;
    map["number"] = _number;
    return map;
  }

}

/// cnae : "82.91-1/00"
/// description : "Atividades de cobranças e informações cadastrais"

class MainActivityBean {
  String _cnae;
  String _description;

  String get cnae => _cnae;
  String get description => _description;

  MainActivityBean(this._cnae, this._description);

  MainActivityBean.map(dynamic obj) {
    this._cnae = obj["cnae"];
    this._description = obj["description"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["cnae"] = _cnae;
    map["description"] = _description;
    return map;
  }

}

/// type : "CNPJ"
/// number : "11.698.147/0001-13"

class TaxDocumentBean {
  String _type;
  String _number;

  String get type => _type;
  String get number => _number;

  TaxDocumentBean(this._type, this._number);

  TaxDocumentBean.map(dynamic obj) {
    this._type = obj["type"];
    this._number = obj["number"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["type"] = _type;
    map["number"] = _number;
    return map;
  }

}