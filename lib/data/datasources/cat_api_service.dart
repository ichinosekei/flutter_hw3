import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/cat_model.dart';
import 'package:flutter/foundation.dart';

class CatApiService {
  static const String _baseUrl =
      'https://api.thecatapi.com/v1/images/search?has_breeds=1';

  final String _apiKey = dotenv.env['CAT_API_KEY']!;
  Future<Cat?> fetchRandomCat() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'x-api-key': _apiKey,
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        for (var item in data) {
          Cat cat = Cat.fromJson(item);
          if (cat.breed != null) {
            return cat;
          }
        }
      } else {
        debugPrint(
            'Ошибка при запросе к API. Код ответа: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Ошибка сети, проверьте подключение к интернету");
    }
    throw Exception("Не удалось загрузить кота");
  }
}
