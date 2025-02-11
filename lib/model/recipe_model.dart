class Recipe {
  String? id;
  String name;
  String description;

  Recipe({this.id, required this.name, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['id'].toString(),  // Convert int to String to prevent type errors
      name: map['name'],
      description: map['description'],
    );
  }
}
