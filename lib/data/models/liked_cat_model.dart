import '../../domain/entities/liked_cat_entity.dart';

class LikedCatModel extends LikedCatEntity {
  LikedCatModel({
    required super.id,
    required super.imageUrl,
    required super.breed,
    required super.likedAt,
  });

  factory LikedCatModel.fromJson(Map<String, dynamic> json) {
    return LikedCatModel(
      id: json['id'],
      imageUrl: json['image_url'],
      breed: json['breed'],
      likedAt: DateTime.parse(json['liked_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_url': imageUrl,
      'breed': breed,
      'liked_at': likedAt.toIso8601String(),
    };
  }
}
