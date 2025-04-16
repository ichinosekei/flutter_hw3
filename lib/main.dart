import 'package:cats_tinder/presentation/liked_cats/cubit/liked_cats_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di/locator.dart';
import 'presentation/cat/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
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
          create: (_) => LikedCatsCubit(),
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
