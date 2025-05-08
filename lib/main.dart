import 'package:cats_tinder/presentation/connectivity/network_cubit.dart';
import 'package:cats_tinder/presentation/liked_cats/cubit/liked_cats_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'data/repositories/cat_repository.dart';
import 'di/locator.dart';
import 'presentation/cat/screens/main_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LikedCatsCubit>(
          create: (_) => LikedCatsCubit(locator<CatRepository>()),
        ),
        BlocProvider<NetworkCubit>(
          create: (_) => NetworkCubit(locator<CatRepository>()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CatsTinder',
        home: CatHomePage(),
      ),
    );
  }
}
