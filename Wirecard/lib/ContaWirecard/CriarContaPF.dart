class CriarContaPF {
    Links links;
    String accessToken;
    String channelId;
    String createdAt;
    Email email;
    String id;
    String login;
    Person person;
    bool transparentAccount;
    String type;

    CriarContaPF({this.links, this.accessToken, this.channelId, this.createdAt, this.email, this.id, this.login, this.person, this.transparentAccount, this.type});

    factory CriarContaPF.fromJson(Map<String, dynamic> json) {
        return CriarContaPF(
          links: json['links'] != null ? Links.fromJson(json['links']) : null,
            accessToken: json['accessToken'],
            channelId: json['channelId'],
            createdAt: json['createdAt'],
            email: json['email'] != null ? Email.fromJson(json['email']) : null,
            id: json['id'],
            login: json['login'],
            person: json['person'] != null ? Person.fromJson(json['person']) : null,
            transparentAccount: json['transparentAccount'],
            type: json['type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['accessToken'] = this.accessToken;
        data['channelId'] = this.channelId;
        data['createdAt'] = this.createdAt;
        data['id'] = this.id;
        data['login'] = this.login;
        data['transparentAccount'] = this.transparentAccount;
        data['type'] = this.type;
        if (this.links != null) {
            data['links'] = this.links.toJson();
        }
        if (this.email != null) {
            data['email'] = this.email.toJson();
        }
        if (this.person != null) {
            data['person'] = this.person.toJson();
        }
        return data;
    }
}
class ContaPFRegistrado {
    Links links;
    String accessToken;
    String channelId;
    String createdAt;
    Email email;
    String id;
    String login;
    Person person;
    bool transparentAccount;
    String type;

    ContaPFRegistrado({this.links, this.accessToken, this.channelId, this.createdAt, this.email, this.id, this.login, this.person, this.transparentAccount, this.type});

    factory ContaPFRegistrado.fromJson(Map<String, dynamic> json) {
        return ContaPFRegistrado(
            links: json['links'] != null ? Links.fromJson(json['links']) : null,
            accessToken: json['accessToken'],
            channelId: json['channelId'],
            createdAt: json['createdAt'],
            email: json['email'] != null ? Email.fromJson(json['email']) : null,
            id: json['id'],
            login: json['login'],
            person: json['person'] != null ? Person.fromJson(json['person']) : null,
            transparentAccount: json['transparentAccount'],
            type: json['type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['accessToken'] = this.accessToken;
        data['channelId'] = this.channelId;
        data['createdAt'] = this.createdAt;
        data['id'] = this.id;
        data['login'] = this.login;
        data['transparentAccount'] = this.transparentAccount;
        data['type'] = this.type;
        if (this.links != null) {
            data['links'] = this.links.toJson();
        }
        if (this.email != null) {
            data['email'] = this.email.toJson();
        }
        if (this.person != null) {
            data['person'] = this.person.toJson();
        }
        return data;
    }
}

class Person {
    Address address;
    String birthDate;
    IdentityDocument identityDocument;
    String lastName;
    String name;
    Phone phone;
    TaxDocument taxDocument;

    Person({this.address, this.birthDate, this.identityDocument, this.lastName, this.name, this.phone, this.taxDocument});

    factory Person.fromJson(Map<String, dynamic> json) {
        return Person(
            address: json['address'] != null ? Address.fromJson(json['address']) : null,
            birthDate: json['birthDate'],
            identityDocument: json['identityDocument'] != null ? IdentityDocument.fromJson(json['identityDocument']) : null,
            lastName: json['lastName'],
            name: json['name'],
            phone: json['phone'] != null ? Phone.fromJson(json['phone']) : null,
            taxDocument: json['taxDocument'] != null ? TaxDocument.fromJson(json['taxDocument']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['birthDate'] = this.birthDate;
        data['lastName'] = this.lastName;
        data['name'] = this.name;
        if (this.address != null) {
            data['address'] = this.address.toJson();
        }
        if (this.identityDocument != null) {
            data['identityDocument'] = this.identityDocument.toJson();
        }
        if (this.phone != null) {
            data['phone'] = this.phone.toJson();
        }
        if (this.taxDocument != null) {
            data['taxDocument'] = this.taxDocument.toJson();
        }
        return data;
    }
}

class TaxDocument {
    String number;
    String type;

    TaxDocument({this.number, this.type});

    factory TaxDocument.fromJson(Map<String, dynamic> json) {
        return TaxDocument(
            number: json['number'],
            type: json['type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['number'] = this.number;
        data['type'] = this.type;
        return data;
    }
}

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

class IdentityDocument {
    String issueDate;
    String issuer;
    String number;
    String type;

    IdentityDocument({this.issueDate, this.issuer, this.number, this.type});

    factory IdentityDocument.fromJson(Map<String, dynamic> json) {
        return IdentityDocument(
            issueDate: json['issueDate'],
            issuer: json['issuer'],
            number: json['number'],
            type: json['type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['issueDate'] = this.issueDate;
        data['issuer'] = this.issuer;
        data['number'] = this.number;
        data['type'] = this.type;
        return data;
    }
}

class Address {
    String city;
    String country;
    String district;
    String state;
    String street;
    String streetNumber;
    String zipCode;
    String zipcode;

    Address({this.city, this.country, this.district, this.state, this.street, this.streetNumber, this.zipCode, this.zipcode});

    factory Address.fromJson(Map<String, dynamic> json) {
        return Address(
            city: json['city'],
            country: json['country'],
            district: json['district'],
            state: json['state'],
            street: json['street'],
            streetNumber: json['streetNumber'],
            zipCode: json['zipCode'],
            zipcode: json['zipcode'],
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
        data['zipcode'] = this.zipcode;
        return data;
    }
}

class Links {
    Self self;
    SetPassword setPassword;

    Links({this.self, this.setPassword});

    factory Links.fromJson(Map<String, dynamic> json) {
        return Links(
            self: json['self'] != null ? Self.fromJson(json['self']) : null,
            setPassword: json['setPassword'] != null ? SetPassword.fromJson(json['setPassword']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.self != null) {
            data['self'] = this.self.toJson();
        }
        if (this.setPassword != null) {
            data['setPassword'] = this.setPassword.toJson();
        }
        return data;
    }
}

class SetPassword {
    String href;

    SetPassword({this.href});

    factory SetPassword.fromJson(Map<String, dynamic> json) {
        return SetPassword(
            href: json['href'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['href'] = this.href;
        return data;
    }
}

class Self {
    String href;

    Self({this.href});

    factory Self.fromJson(Map<String, dynamic> json) {
        return Self(
            href: json['href'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['href'] = this.href;
        return data;
    }
}

class Email {
    String address;
    bool confirmed;

    Email({this.address, this.confirmed});

    factory Email.fromJson(Map<String, dynamic> json) {
        return Email(
            address: json['address'],
            confirmed: json['confirmed'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['confirmed'] = this.confirmed;
        return data;
    }
}