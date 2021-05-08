class mainActivity{
  String cnae;
  String description;

  mainActivity({this.cnae, this.description});

  @override
  String toString() {
    return 'mainActivity{cnae: $cnae, description: $description}';
  }

  mainActivity.fromJson(Map<String, dynamic> json)
      : cnae = json['cnae'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        'cnae': cnae,
        'description': description,
      };
}