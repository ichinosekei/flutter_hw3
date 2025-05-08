import 'package:mocktail/mocktail.dart';
import 'package:cats_tinder/data/repositories/cat_repository.dart';
import 'package:cats_tinder/domain/entities/liked_cat_entity.dart';

class MockCatRepository extends Mock implements CatRepository {}

void registerFallbacks() {
  registerFallbackValue(
    LikedCatEntity(id: '0', imageUrl: '', breed: '', likedAt: DateTime.now()),
  );
}
