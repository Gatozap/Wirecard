class TosAcceptance{
String acceptedAt;
String ip;
String userAgent;

TosAcceptance({this.acceptedAt, this.ip, this.userAgent});

@override
  String toString() {
    return 'TosAcceptance{acceptedAt: $acceptedAt, ip: $ip, userAgent: $userAgent}';
  }

TosAcceptance.fromJson(Map<String, dynamic> json)
      : acceptedAt = json['acceptedAt'],
        ip = json['ip'],
        userAgent = json['userAgent'];

  Map<String, dynamic> toJson() => {
        'acceptedAt': acceptedAt,
        'ip': ip,
        'userAgent': userAgent,
      };
}