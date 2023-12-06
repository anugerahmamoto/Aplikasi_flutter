import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider/news.provider.dart';
import 'package:flutter_application_1/componen/news.dart';
import 'package:flutter_application_1/pages/search.page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getNews(){
        Provider.of<NewsProvider>(context,listen: false).getTopNews();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }
  Widget build(BuildContext context) {
{
        return Consumer<NewsProvider>(
          builder: (BuildContext context , news , Widget? child) {
            return RefreshIndicator(
              onRefresh: () async {
                news.setLoading(true);
                return await getNews();
              },
              child: Scaffold(
                appBar: AppBar(
                title: const Text('Berita Terbaru Saat Ini'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right : 20.0),
                    child: IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,MaterialPageRoute(
                            builder: (context) => const SearchPage()),
                            );}, 
                            icon: Icon(Icons.search)),
                  )
                  ],
                ),
              body: SingleChildScrollView(
                child: Padding( 
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      news.isLoading 
                      ? const Center(child: CircularProgressIndicator(),
                      )
                      : Column(
                        children: [
                          ...news.resNews!.articles!.map((
                            e) => News(
                            title: e.title ?? '',
                            image: e.urlToImage ?? '',
                            )
                          ),
                        ],
                      ),
                        ]
                        ),
                )),
              ),
            );
          }
        );
      }
  }
}