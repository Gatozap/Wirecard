

import 'package:Wirecard/Objetos/Geolocation.dart';

class Device {
  String fingerprint;
  Geolocation geolocation;
  String ip;
  String userAgent;

  Device({this.fingerprint, this.geolocation, this.ip, this.userAgent});

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      fingerprint: json['fingerprint'],
      geolocation: json['geolocation'] != null ? Geolocation.fromJson(json['geolocation']) : null,
      ip: json['ip'],
      userAgent: json['userAgent'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fingerprint'] = this.fingerprint;
    data['ip'] = this.ip;
    data['userAgent'] = this.userAgent;
    if (this.geolocation != null) {
      data['geolocation'] = this.geolocation.toJson();
    }
    return data;
  }
}