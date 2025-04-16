import 'package:get_it/get_it.dart';
import '../data/datasources/cat_api_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<CatApiService>(() => CatApiService());
}
