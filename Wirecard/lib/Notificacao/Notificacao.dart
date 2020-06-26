class Notificacao {
    List<String> events;
    String media;
    String target;
    String token;
    String id;
    Notificacao({this.events, this.media, this.target,this.id,this.token});

    factory Notificacao.fromJson(Map<String, dynamic> json) {
        return Notificacao(
            events: json['events'] != null ? new List<String>.from(json['events']) : null,
            media: json['media'],
            target: json['target'],
            id: json['id'],
            token: json['token'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['media'] = this.media;
        data['target'] = this.target;
        if (this.events != null) {
            data['events'] = this.events;
        }
        data['id'] = this.id;
        data['token'] = this.token;
        return data;
    }
}




