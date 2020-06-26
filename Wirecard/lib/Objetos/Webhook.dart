class Webhook {
    String event;
    String resourceId;

    Webhook({this.event, this.resourceId});

    factory Webhook.fromJson(Map<String, dynamic> json) {
        return Webhook(
            event: json['event'],
            resourceId: json['resourceId'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['event'] = this.event;
        data['resourceId'] = this.resourceId;
        return data;
    }
}