
class Email {
  String address;
  bool confirmed;

  Email({this.address, this.confirmed});

  factory Email.fromJson(Map<String, dynamic> json) {
    return Email(
      address: json['address'],
      confirmed: json['confirmed'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['confirmed'] = this.confirmed;
    return data;
  }
}