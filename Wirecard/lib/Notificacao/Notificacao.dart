class Notificacao {
    List<String> events;
    String media;
    String target;

    Notificacao({this.events, this.media, this.target});

    factory Notificacao.fromJson(Map<String, dynamic> json) {
        return Notificacao(
            events: json['events'] != null ? new List<String>.from(json['events']) : null,
            media: json['media'],
            target: json['target'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['media'] = this.media;
        data['target'] = this.target;
        if (this.events != null) {
            data['events'] = this.events;
        }
        return data;
    }
}