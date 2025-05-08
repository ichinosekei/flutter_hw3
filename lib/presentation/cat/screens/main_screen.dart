import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../data/models/cat_model.dart';
import '../../../data/repositories/cat_repository.dart';
import '../../../domain/entities/liked_cat_entity.dart';

import '../../connectivity/network_cubit.dart';
import '../../liked_cats/cubit/liked_cats_cubit.dart';
import '../../liked_cats/screens/liked_cats_screen.dart';
import '../widgets/dislike_button.dart';
import '../widgets/like_button.dart';
import 'detail_screen.dart';

void main() {
  runApp(const CatApp());
}

class CatApp extends StatelessWidget {
  const CatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CatsTinder',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CatHomePage(),
    );
  }
}

class CatHomePage extends StatefulWidget {
  const CatHomePage({super.key});

  @override
  CatHomePageState createState() => CatHomePageState();
}

class CatHomePageState extends State<CatHomePage> {
  Cat? currentCat;
  int likeCount = 0;
  bool isLoading = false;
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? _offlineSnack;
  @override
  void initState() {
    super.initState();
    fetchNewCat();
  }

  void _showOfflineSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> fetchNewCat() async {
    setState(() => isLoading = true);
    try {
      final repo = GetIt.I<CatRepository>();
      final cat = await repo.fetchRandomCat();
      if (!mounted) return;
      setState(() => currentCat = cat);
    } catch (e) {
      if (!mounted) return;
      _showOfflineSnackBar(e.toString());
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  void _handleFavoritePressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LikedCatsScreen()),
    );
  }

  void handleLike() {
    if (currentCat == null) return;
    final likedCat = LikedCatEntity(
      id: currentCat!.id,
      imageUrl: currentCat!.url,
      breed: currentCat!.breed?.name ?? 'Неизвестно',
      likedAt: DateTime.now(),
    );

    context.read<LikedCatsCubit>().addCat(likedCat);
    setState(() => likeCount++);
    fetchNewCat();
  }

  void handleDislike() {
    fetchNewCat();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkCubit, bool>(
      listener: (context, isOnline) {
        final messenger = ScaffoldMessenger.of(context);

        if (isOnline) {
          _offlineSnack?.close();
          _offlineSnack = null;

          messenger.showSnackBar(
            const SnackBar(
              content: Text('Соединение восстановлено'),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          _offlineSnack ??= messenger.showSnackBar(
            SnackBar(
              content: const Text('Нет подключения к интернету'),
              duration: const Duration(days: 1),
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CatsTinder'),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: _handleFavoritePressed,
            ),
          ],
        ),
        body: isLoading || currentCat == null
            ? const Center(child: CircularProgressIndicator())
            : GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(cat: currentCat!),
                    ),
                  );
                },
                child: Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      handleLike();
                    } else {
                      handleDislike();
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: CachedNetworkImage(
                            imageUrl: currentCat!.url,
                            fit: BoxFit.cover,
                            placeholder: (_, __) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (_, __, ___) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Порода: ${currentCat!.breed?.name ?? 'Неизвестно'}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Лайков: $likeCount',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LikeButton(
                            id: currentCat!.id,
                            imageUrl: currentCat!.url,
                            breed: currentCat!.breed?.name ?? 'Неизвестно',
                            onPressed: handleLike,
                          ),
                          DislikeButton(onPressed: handleDislike),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
