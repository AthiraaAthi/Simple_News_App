import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:selfyt_news_api/model/model.dart';
import 'package:http/http.dart' as http;

class MyController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  SampleNewsApi newsapiobj = SampleNewsApi();

  Future fetchData() async {
    notifyListeners();
    final newsUrl = Uri.parse(
      "https://newsapi.org/v2/everything?q=apple&from=2023-12-24&to=2023-12-24&sortBy=popularity&apiKey=e8c8ab89a94343fdb306149805f02275",
    );
    final response = await http.get(newsUrl);
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      print(decodedData);
      newsapiobj = SampleNewsApi.fromJson(decodedData);
      //setState(() {});
      //notifyListeners();
    } else {
      print("api failed");
    }
  }
}
