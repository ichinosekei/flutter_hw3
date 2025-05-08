import '../../domain/entities/liked_cat_entity.dart';
import '../datasources/cat_api_service.dart';
import '../local/database.dart';
import '../models/cat_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class CatRepository {
  Future<Cat> fetchRandomCat();
  Stream<ConnectivityResult> connectivityStream();
  Future<List<Cat>> getCachedCats();
  Future<List<LikedCatEntity>> getLikedCats();
  Future<void> likeCat(LikedCatEntity cat);
  Future<void> dislikeCat(String id);
}

class CatRepositoryImpl implements CatRepository {
  final CatApiService api;
  final AppDatabase db;
  final Connectivity _connectivity;

  CatRepositoryImpl(this.api, this.db, this._connectivity);

  @override
  Stream<ConnectivityResult> connectivityStream() =>
      _connectivity.onConnectivityChanged;

  @override
  Future<Cat> fetchRandomCat() async {
    // 1) сеть есть → пробуем API
    if (await _connectivity.checkConnectivity() != ConnectivityResult.none) {
      try {
        final cat = await api.fetchRandomCat();

        await db.cacheCat(cat!);
        return cat;
      } catch (_) {/* упало – используем кэш */}
    }

    // 2) оффлайн или ошибка → случайный из кэша
    final cached = await db.getCachedCats();
    if (cached.isNotEmpty) {
      cached.shuffle();
      return cached.first;
    }
    throw Exception('Нет доступа к сети, а кэш пуст');
  }

  // delegate быстрому коду в DB ↓
  @override
  Future<List<Cat>> getCachedCats() => db.getCachedCats();
  @override
  Future<List<LikedCatEntity>> getLikedCats() => db.getAllLiked();
  @override
  Future<void> likeCat(LikedCatEntity cat) => db.likeCat(cat);
  @override
  Future<void> dislikeCat(String id) => db.dislikeCat(id);
}
