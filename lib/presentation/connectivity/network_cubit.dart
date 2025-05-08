import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/cat_repository.dart';

class NetworkCubit extends Cubit<bool> {
  NetworkCubit(CatRepository repo) : super(true) {
    repo.connectivityStream().listen((result) {
      emit(result != ConnectivityResult.none);
    });
  }
}
