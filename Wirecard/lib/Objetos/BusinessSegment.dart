class BusinessSegment{
  String id;

  BusinessSegment({this.id});

  @override
  String toString() {
    return 'BusinessSegment{id: $id}';
  }

  BusinessSegment.fromJson(Map<String, dynamic> json) : id = json['id'];

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}