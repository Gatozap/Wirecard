class Key {
    Keys keys;

    Key({this.keys});

    factory Key.fromJson(Map<String, dynamic> json) {
        return Key(
            keys: json['keys'] != null ? Keys.fromJson(json['keys']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.keys != null) {
            data['keys'] = this.keys.toJson();
        }
        return data;
    }
}

class Keys {
    BasicAuth basicAuth;
    String encryption;

    Keys({this.basicAuth, this.encryption});

    factory Keys.fromJson(Map<String, dynamic> json) {
        return Keys(
            basicAuth: json['basicAuth'] != null ? BasicAuth.fromJson(json['basicAuth']) : null,
            encryption: json['encryption'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['encryption'] = this.encryption;
        if (this.basicAuth != null) {
            data['basicAuth'] = this.basicAuth.toJson();
        }
        return data;
    }
}

class BasicAuth {
    String secret;
    String token;

    BasicAuth({this.secret, this.token});

    factory BasicAuth.fromJson(Map<String, dynamic> json) {
        return BasicAuth(
            secret: json['secret'],
            token: json['token'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['secret'] = this.secret;
        data['token'] = this.token;
        return data;
    }
}