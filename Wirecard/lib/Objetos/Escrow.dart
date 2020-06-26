class Escrow{
  String description;

  Escrow(this.description);

  Escrow.fromJson(Map<String, dynamic> json)
      : description = json['description'];

  Map<String, dynamic> toJson() => {
        'description': description,
      };

  @override
  String toString() {
    return 'Escrow{description: $description}';
  }
}