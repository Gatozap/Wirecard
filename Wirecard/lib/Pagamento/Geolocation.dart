class Geolocation {
  double latitude;
  double longitude;

  Geolocation({this.latitude, this.longitude});

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    return Geolocation(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}