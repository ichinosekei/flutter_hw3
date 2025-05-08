import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/cat_repository.dart';
import '../../../domain/entities/liked_cat_entity.dart';
part 'liked_cats_state.dart';

class LikedCatsCubit extends Cubit<LikedCatsState> {
  final CatRepository repo;

  LikedCatsCubit(this.repo) : super(const LikedCatsState()) {
    _load();
  }

  Future<void> _load() async {
    final liked = await repo.getLikedCats();
    emit(state.copyWith(allCats: liked, filteredCats: liked));
  }

  Future<void> addCat(LikedCatEntity cat) async {
    await repo.likeCat(cat);
    final updated = List<LikedCatEntity>.from(state.allCats)..add(cat);
    emit(state.copyWith(
        allCats: updated,
        filteredCats: _applyFilter(updated, state.selectedBreed)));
  }

  void removeCat(String id) {
    final updated = state.allCats.where((c) => c.id != id).toList();

    // Проверяем, осталась ли текущая выбранная порода
    final breedStillExists = updated.any((c) => c.breed == state.selectedBreed);

    final selected = breedStillExists ? state.selectedBreed : 'Все породы';
    final filtered = _applyFilter(updated, selected);

    emit(state.copyWith(
      allCats: updated,
      selectedBreed: selected,
      filteredCats: filtered,
    ));
  }

  void filterByBreed(String? breed) {
    emit(state.copyWith(
      selectedBreed: breed,
      filteredCats: _applyFilter(state.allCats, breed),
    ));
  }

  List<LikedCatEntity> _applyFilter(List<LikedCatEntity> cats, String? breed) {
    if (breed == null || breed == 'Все породы') return cats;
    return cats
        .where((c) => c.breed.toLowerCase() == breed.toLowerCase())
        .toList();
  }
}
