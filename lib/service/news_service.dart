import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_bloc/constants/api_const.dart';
import 'package:news_app_bloc/models/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class NewsService {
  const NewsService(this.client);

  final http.Client client;

  Future<Map<String, dynamic>?> getNewsByCountry([String countryCode = 'us'])async{
    try{
      final uri = Uri.parse(ApiConst.countryNews(countryCode));
      final response = await client.get(uri);
      if(response.statusCode == 200 || response.statusCode == 201){
        final news = (jsonDecode(response.body) as Map<String, dynamic>;
        final news = (body['articles'] as List).map((e) => News.fromJson(e)).toList();
        return news;
      
      }else {
        log('${response.statusCode},);
        return null;
      }

    } catch(e){
      log(e.toString());
      return null;
    }
  }



}
