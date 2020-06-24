
class HostedAccount {
  String redirectHref;

  HostedAccount({this.redirectHref});

  factory HostedAccount.fromJson(Map<String, dynamic> json) {
    return HostedAccount(
      redirectHref: json['redirectHref'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['redirectHref'] = this.redirectHref;
    return data;
  }
}