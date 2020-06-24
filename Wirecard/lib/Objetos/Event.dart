
class Event {
  String createdAt;
  String type;

  Event({this.createdAt, this.type});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      createdAt: json['createdAt'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['type'] = this.type;
    return data;
  }
}

