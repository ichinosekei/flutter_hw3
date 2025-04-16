import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../cubit/liked_cats_cubit.dart';

class LikedCatsScreen extends StatelessWidget {
  const LikedCatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liked Cats')),
      body: const _LikedCatsBody(),
    );
  }
}

class _LikedCatsBody extends StatelessWidget {
  const _LikedCatsBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikedCatsCubit, LikedCatsState>(
      builder: (context, state) {
        final cubit = context.read<LikedCatsCubit>();
        final breeds = {...state.allCats.map((e) => e.breed)}.toList()..sort();

        final breedOptions = ['Все породы', ...breeds];
        final safeSelectedBreed = breedOptions.contains(state.selectedBreed)
            ? state.selectedBreed
            : 'Все породы';
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                value: safeSelectedBreed,
                hint: const Text("Фильтр по породе"),
                isExpanded: true,
                items: [
                  const DropdownMenuItem(
                      value: "Все породы", child: Text("Все породы")),
                  ...breeds
                      .map((b) => DropdownMenuItem(value: b, child: Text(b))),
                ],
                onChanged: (value) => cubit.filterByBreed(value),
              ),
            ),
            Expanded(
              child: state.filteredCats.isEmpty
                  ? const Center(child: Text("Нет лайкнутых котиков"))
                  : ListView.builder(
                      itemCount: state.filteredCats.length,
                      itemBuilder: (context, index) {
                        final cat = state.filteredCats[index];
                        return Dismissible(
                          key: Key(cat.id),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) => cubit.removeCat(cat.id),
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 16),
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: ListTile(
                              leading: Image.network(cat.imageUrl,
                                  width: 60, height: 60, fit: BoxFit.cover),
                              title: Text(cat.breed),
                              subtitle: Text(
                                  'Лайк: ${DateFormat.yMd().add_Hm().format(cat.likedAt)}'),
                              trailing: IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => cubit.removeCat(cat.id),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
