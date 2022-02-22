import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '02011706ae26c52811568a92a0c2f8ab';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    //print(decodedData['dates']);
    print(decodedData['results']);
  }
}
