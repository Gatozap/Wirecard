
class InstructionLines {
  String first;
  String second;
  String third;

  InstructionLines({this.first, this.second, this.third});

  factory InstructionLines.fromJson(Map<String, dynamic> json) {
    return InstructionLines(
      first: json['first'],
      second: json['second'],
      third: json['third'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['second'] = this.second;
    data['third'] = this.third;
    return data;
  }
}