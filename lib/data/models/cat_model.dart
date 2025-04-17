class Cat {
  final String id;
  final String url;
  final Breed? breed;

  Cat({required this.id, required this.url, this.breed});

  factory Cat.fromJson(Map<String, dynamic> json) {
    Breed? breed;
    if (json['breeds'] != null && json['breeds'].isNotEmpty) {
      breed = Breed.fromJson(json['breeds'][0]);
    }
    return Cat(
      id: json['id'],
      url: json['url'],
      breed: breed,
    );
  }
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cat &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          url == other.url;
  @override
  int get hashCode => id.hashCode ^ url.hashCode;
}

class Breed {
  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String description;

  Breed({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Неизвестно',
      temperament: json['temperament'] ?? '',
      origin: json['origin'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
