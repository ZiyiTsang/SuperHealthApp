import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/Article.dart';
import '../Model/Contact.dart';

void showNetworkStatusDialog(BuildContext context, bool isAvailable) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Network"),
        content: Text(isAvailable ? "Network is available" : "Network is not available"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
void showDialog_custom(BuildContext context, String title,String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}

void showSnackbar(BuildContext context, String text, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: color,
    ),
  );

}
Contact getUserById(int id) {
  Map<int, Contact> contact_map=Contact.getContactDatabase();
  return contact_map[id]!;
}

ImageProvider getImage(String url) {
  print(url);
  if (url.startsWith('http://') || url.startsWith('https://')){
    print(1234);
    return Image.network(url).image;
  }
  return Image.asset(url).image;
}

Future<bool> tryImageSync(String? imageUrl) async {
  if (imageUrl == null) {
    return false;
  }
  try {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}

Future<void> removeArticlesWithNullFields(List<Article> articles) async {
  List<Article> toRemove = [];
  for (var article in articles) {
    if (article.urlToImage != null && !await tryImageSync(article.urlToImage)) {
      article.urlToImage = null;
    }
    if (article.source == null ||
        article.author == null ||
        article.title == null ||
        article.description == null ||
        article.url == null ||
        article.publishedAt == null ||
        article.content == null) {
      toRemove.add(article);
    }
  }
  articles.removeWhere((article) => toRemove.contains(article));
}
