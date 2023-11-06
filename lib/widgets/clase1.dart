import 'package:flutter/material.dart';
import 'package:tarea5api/widgets/api.dart';


class principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias'),
      ),
      body: FutureBuilder<List<NewsArticle>>(
        future: NewsService().fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final newsList = snapshot.data;

            return ListView.builder(
              itemCount: newsList?.length,
              itemBuilder: (context, index) {
                final article = newsList?[index];

                return ListTile(
                  title: Text(article!.title),
                  subtitle: Text(article.description),
                  onTap: () { 
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}  
