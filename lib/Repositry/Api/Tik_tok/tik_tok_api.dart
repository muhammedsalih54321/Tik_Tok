import 'dart:convert';

import 'package:http/http.dart';
import 'package:tik_tok/Repositry/Model/Vidios_model.dart';
import 'package:tik_tok/Repositry/Model/tik_tok_model.dart';

import '../api_client.dart';

class TiktokApi {
  ApiClient apiClient = ApiClient();

  Future<Tiktokmodel> getTiktok() async {
    String trendingpath =
        'https://tiktok-scraper7.p.rapidapi.com/?url=https%3A%2F%2Fwww.tiktok.com%2F%40tiktok%2Fvideo%2F7233463396124052782&hd=';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Tiktokmodel.fromJson(jsonDecode(response.body));
  }
  Future<VideoModel> getVidios(String name) async {
    String trendingpath =
        'https://tiktok-scraper7.p.rapidapi.com/feed/search?keywords=${name}&region=us&count=10&cursor=0&publish_time=0&sort_type=0';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return VideoModel.fromJson(jsonDecode(response.body));
  }
}
