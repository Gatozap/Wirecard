class App {
    String description;
    String name;
    String redirectUri;
    String site;
    String accessToken;
    String createdAt;

    String id;


    String secret;
    String updatedAt;
    String website;
    App({this.description, this.name, this.redirectUri, this.site, this.accessToken, this.createdAt,  this.id,   this.secret, this.updatedAt, this.website});

    factory App.fromJson(Map<String, dynamic> json) {
        return App(
            description: json['description'],
            name: json['name'],
            redirectUri: json['redirectUri'],
            site: json['site'],
            accessToken: json['accessToken'],
            createdAt: json['createdAt'],

            id: json['id'],

            secret: json['secret'],
            updatedAt: json['updatedAt'],
            website: json['website'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['description'] = this.description;
        data['name'] = this.name;
        data['redirectUri'] = this.redirectUri;
        data['site'] = this.site;
        data['accessToken'] = this.accessToken;
        data['createdAt'] = this.createdAt;

        data['id'] = this.id;


        data['secret'] = this.secret;
        data['updatedAt'] = this.updatedAt;
        data['website'] = this.website;
        return data;
    }
}

