
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
