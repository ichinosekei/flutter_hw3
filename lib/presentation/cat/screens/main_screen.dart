import 'dart:io'; // 🟡 Добавлено
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../data/datasources/cat_api_service.dart';
import '../../../data/models/cat_model.dart';
import '../../../domain/entities/liked_cat_entity.dart';
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
      title: 'CatsTunder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CatHomePage(),
    );
  }
}

class CatHomePage extends StatefulWidget {
  const CatHomePage({super.key});

  @override
  CatHomePageState createState() => CatHomePageState();
}

void _showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text("Ошибка сети"),
      content: Text(message),
      actions: [
        TextButton(
          child: const Text("OK"),
          onPressed: () => Navigator.of(ctx).pop(),
        ),
      ],
    ),
  );
}

class CatHomePageState extends State<CatHomePage> {
  Cat? currentCat;
  int likeCount = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchNewCat();
  }

  Future<void> fetchNewCat() async {
    setState(() {
      isLoading = true;
    });
    try {
      final api = GetIt.I<CatApiService>();
      Cat? cat = await api.fetchRandomCat();
      setState(() {
        currentCat = cat;
      });
    } catch (e) {
      if (!mounted) return;
      _showErrorDialog(context, e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _handleFavoritePressed() async {
    bool isConnected = false;

    try {
      final result = await InternetAddress.lookup('example.com');
      isConnected = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      isConnected = false;
    }

    if (!mounted) return;

    if (isConnected) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LikedCatsScreen()),
      );
    } else {
      _showErrorDialog(context, "Нет подключения к интернету");
    }
  }

  void handleLike() {
    final likedCat = LikedCatEntity(
      id: currentCat!.id,
      imageUrl: currentCat!.url,
      breed: currentCat!.breed?.name ?? 'Неизвестно',
      likedAt: DateTime.now(),
    );

    context.read<LikedCatsCubit>().addCat(likedCat);
    setState(() {
      likeCount++;
    });
    fetchNewCat();
  }

  void handleDislike() {
    fetchNewCat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              _handleFavoritePressed();
            },
          ),
        ],
        title: const Text('CatsTinder'),
      ),
      body: isLoading || currentCat == null
          ? const Center(child: CircularProgressIndicator())
          : GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(cat: currentCat!),
                  ),
                );
              },
              child: Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    handleLike();
                  } else if (direction == DismissDirection.endToStart) {
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
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
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
    );
  }
}
