
class MoipAccount {
  String id;

  MoipAccount({this.id});

  factory MoipAccount.fromJson(Map<String, dynamic> json) {
    return MoipAccount(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}