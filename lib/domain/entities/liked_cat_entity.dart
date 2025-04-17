class LikedCatEntity {
  final String id;
  final String imageUrl;
  final String breed;
  final DateTime likedAt;

  LikedCatEntity({
    required this.id,
    required this.imageUrl,
    required this.breed,
    required this.likedAt,
  });
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is LikedCatEntity && id == other.id;
  @override
  int get hashCode => id.hashCode;
}
