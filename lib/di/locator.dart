import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/cat_api_service.dart';
import '../data/local/database.dart';
import '../data/repositories/cat_repository.dart';

final locator = GetIt.instance;

void setupLocator() {
  final db = AppDatabase();
  final connectivity = Connectivity();

  locator
    ..registerLazySingleton<AppDatabase>(() => db)
    ..registerLazySingleton<Connectivity>(() => connectivity)
    ..registerLazySingleton<CatApiService>(() => CatApiService())
    ..registerLazySingleton<CatRepository>(
        () => CatRepositoryImpl(locator<CatApiService>(), db, connectivity));
}
