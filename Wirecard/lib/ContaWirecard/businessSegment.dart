class businessSegment{
  String id;

  businessSegment({this.id});

  @override
  String toString() {
    return 'businessSegment{id: $id}';
  }

  businessSegment.fromJson(Map<String, dynamic> json) : id = json['id'];

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}
