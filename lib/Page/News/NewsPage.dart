import 'dart:math';

import 'package:flutter/material.dart';
import 'package:third/Model/Article.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Utils/NetworkUtils_News.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late List<Article> news = [];
  late bool is_loading = true;
  late bool is_error = false;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadNews("health");
  }

  Future<void> _loadNews(String query_str) async {
    Future<List<dynamic>> result =
        NetworkUtilsNews().get_news(query_str, _currentIndex);
    result.then((value) {
      if (value[0]) {
        setState(() {
          news = value[1];
          is_loading = false;
          is_error = false;
        });
      } else {
        setState(() {
          is_loading = false;
          is_error = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: is_loading
            ? _buildLoading()
            : is_error
                ? _buildError()
                : _buildNewsList(),
      ),
      onRefresh: () {
        return Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _currentIndex++;
            Future<List<dynamic>> result =
                NetworkUtilsNews().get_news("epilepsy", _currentIndex);
            result.then((value) {
              news.insertAll(0, value[1]);
            });
          });
        });
      },
    );
  }

  Widget _buildNewsList() {
    return Column(children: [
      Container(
        height: 60,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: Container(),
      ),
      Expanded(
          child: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return _buildNewsCard(news[index]);
        },
      ))
    ]);
  }

  Widget _buildNewsCard(Article article) {
    Container display;
    try {
      display = Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            launchUrl(Uri(path: article.url!));
          },
          child: Column(
            children: [
              Image.network(article.urlToImage!,
                  width: double.infinity, fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) {
                Random random = new Random();
                return Image.asset(
                    "assets/images/NewsImage/${random.nextInt(10)}.jpg");
              }),
              Text(article.title!,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
    } catch (e) {
      display = Container();
    }
    return display;
  }

  Widget _buildError() {
    return Center(
      child: Text("Error"),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

// Widget CustomSearchbar() {
//   return SearchAnchor(
//       builder: (BuildContext context, SearchController controller) {
//     return SearchBar(
//       controller: controller,
//       padding: const MaterialStatePropertyAll<EdgeInsets>(
//           EdgeInsets.symmetric(horizontal: 16.0)),
//       onSubmitted: (_) {
//         setState(() {
//           print("searching");
//           is_loading = true;
//           _loadNews("football");
//
//         });
//       },
//       onTap: () {
//         controller.openView();
//       },
//       onChanged: (_) {
//         controller.closeView(_);
//       },
//       leading: const Icon(Icons.search),
//     );
//   }, suggestionsBuilder: (BuildContext context, SearchController controller) {
//     return List<ListTile>.generate(3, (int index) {
//       String item = '';
//       switch (index) {
//         case 0:
//           item = 'Health';
//           break;
//         case 1:
//           item = 'Epilepsy';
//           break;
//         //other
//         case 2:
//           item = 'Covid';
//           break;
//       }
//       return ListTile(
//         title: Text(item),
//         onTap: () {
//           setState(() {
//             controller.closeView(item);
//           });
//         },
//       );
//     });
//   });
//
// }
}
