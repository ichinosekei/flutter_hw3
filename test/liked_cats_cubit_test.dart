import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cats_tinder/presentation/liked_cats/cubit/liked_cats_cubit.dart';
import 'package:cats_tinder/domain/entities/liked_cat_entity.dart';

import 'mocks.dart';

void main() {
  setUpAll(registerFallbacks);

  late MockCatRepository repo;
  late LikedCatsCubit cubit;

  // общий «кот» для тестов
  final cat = LikedCatEntity(
    id: '123',
    imageUrl: 'http://cat.jpg',
    breed: 'maine coon',
    likedAt: DateTime(2024, 1, 1), // фиксированная дата для стабильности
  );

  setUp(() {
    repo = MockCatRepository();
    // при запуске кубит читает БД
    when(() => repo.getLikedCats()).thenAnswer((_) async => []);
    cubit = LikedCatsCubit(repo);
  });

  tearDown(() => cubit.close());

  group('LikedCatsCubit', () {
    blocTest<LikedCatsCubit, LikedCatsState>(
      'addCat: вызывает repo.likeCat и эмитит список, содержащий кота',
      build: () {
        when(() => repo.likeCat(cat)).thenAnswer((_) async {});
        return cubit;
      },
      act: (c) => c.addCat(cat),
      // ▸ проверяем только, что в новом состоянии есть нужный кот
      expect: () => [
        isA<LikedCatsState>()
            .having((s) => s.allCats, 'allCats', contains(cat))
            .having((s) => s.filteredCats, 'filteredCats', contains(cat)),
      ],
      verify: (_) => verify(() => repo.likeCat(cat)).called(1),
    );

    blocTest<LikedCatsCubit, LikedCatsState>(
      'removeCat: убирает кота из списка',
      build: () => cubit,
      seed: () => LikedCatsState(
        allCats: [cat],
        filteredCats: [cat],
      ),
      act: (c) => c.removeCat('123'),
      expect: () => [
        isA<LikedCatsState>()
            .having((s) => s.allCats.isEmpty, 'allCats empty', isTrue)
            .having((s) => s.filteredCats.isEmpty, 'filtered empty', isTrue),
      ],
    );
  });
}
