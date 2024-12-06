import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modular/features/chat/data/models/chat_data_model.dart';

class RequestProvider {
  Future<ChatDataModel> httpRequest() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://kudago.com/public-api/v1.2/movies/?fields=id,publication_date,slug,title,description,body_text,favorites_count,genres,language,budget_currency,age_restriction,stars,director,awards,images,poster,imdb_rating&page_size=100',
        ),
      );
      return ChatDataModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
