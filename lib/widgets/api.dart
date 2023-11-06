import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsService {
  final String apiKey = 'TU_CLAVE_API'; // Reemplaza con tu clave API de NewsAPI.org

  Future<List<NewsArticle>> fetchNews() async {
    final response = await http.get(
      Uri.parse('https://newsapi.org/v2/top-headlines?country=US&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final articles = data['articles'] as List<dynamic>;

      return articles
          .map((article) => NewsArticle(
                title: article['title'] ?? '',
                description: article['description'] ?? '',
                url: article['url'] ?? '',
                imageUrl: article['urlToImage'] ?? '',
              ))
          .toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String imageUrl;

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
  });
}