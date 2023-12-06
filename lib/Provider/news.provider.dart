import 'package:flutter/material.dart';
import 'package:flutter_application_1/halpers/api.dart';
import 'package:flutter_application_1/models/TopNews.model.dart';
import 'package:flutter_application_1/utils/const.dart';

class NewsProvider with ChangeNotifier{
bool isDataEmpty = true;
bool isLoading = true;
bool isLoadingSearch = true;
TopNewsModel? resNews;
TopNewsModel? resSearch;

setLoading(data){
 isLoading = data;
 notifyListeners();
}
getTopNews() async{ // panggil api get news
  final res = await api (
    '${baseUrl}top-headlines?country=us&apiKey=${apiKey}');

    if(res.statusCode == 200){
      resNews = TopNewsModel.fromJson(res.data);
    }else {
      resNews = TopNewsModel();
    }
    isLoading = false;
    notifyListeners();
}
search(String search) async{ // panggil api get news
isDataEmpty = false;
isLoadingSearch = true;
notifyListeners();

  final res = await api (
    '${baseUrl}everything?q=$search&sortBy=popularity&apiKey=b8f799f8d1ff416e8f55b5cb35f27461=${apiKey}');

    if(res.statusCode == 200){
      resSearch = TopNewsModel.fromJson(res.data);
    }else {
      resSearch = TopNewsModel();
    }
    isLoadingSearch = false;
    notifyListeners();

}
}