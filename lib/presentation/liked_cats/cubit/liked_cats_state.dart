part of 'liked_cats_cubit.dart';

class LikedCatsState {
  final List<LikedCatEntity> allCats;
  final List<LikedCatEntity> filteredCats;
  final String? selectedBreed;

  const LikedCatsState({
    this.allCats = const [],
    this.filteredCats = const [],
    this.selectedBreed,
  });

  LikedCatsState copyWith({
    List<LikedCatEntity>? allCats,
    List<LikedCatEntity>? filteredCats,
    String? selectedBreed,
  }) {
    return LikedCatsState(
      allCats: allCats ?? this.allCats,
      filteredCats: filteredCats ?? this.filteredCats,
      selectedBreed: selectedBreed ?? this.selectedBreed,
    );
  }
}
