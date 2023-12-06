import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider/news.provider.dart';
import 'package:flutter_application_1/componen/news.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchcontroler = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
          builder: (BuildContext context , news , Widget? child) {
        return Scaffold(
          appBar: AppBar(
          title: const Text('Cari Berita'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: searchcontroler,
                      decoration: const InputDecoration(
                        hintText: 'Mencari Berita ...',
                        ),
                        ),
                  ),
                      IconButton(
                      onPressed: () {
                        news.search(searchcontroler.text);
                      },
                      icon : const Icon(Icons.send),
                      )
                      ],
                      ),
                      const SizedBox(height: 20,
                      ),
                      news.isDataEmpty ? 
                      const SizedBox() 
                      : news.isLoadingSearch
                      ? const Center(child: CircularProgressIndicator(),
                      )
                      : Column(
                        children: [
                          ...news.resSearch!.articles!.map((
                            e) => News(
                            title: e.title ?? '',
                            image: e.urlToImage ?? '',
                            )
                          ),
                        ],
                      ),
                     // News(
                     //title: 'testing',
                     // image: 'https://media.cnn.com/api/v1/images/stellar/prod/231203134349-alaska-airlines-file-2023.jpg?c=16x9&q=w_800,c_fill',
                    //  )
                      ],
                    ),
            )),
          );
      }
    );
  }
}