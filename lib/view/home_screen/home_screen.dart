import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selfyt_news_api/controller/my_controller.dart';
import 'package:selfyt_news_api/view/home_screen/home_screen_widget.dart';

import '../../model/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SampleNewsApi newsapiobj = SampleNewsApi();
  @override
  void initState() {
    // TODO: implement initState
    //fetchData();
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    await Provider.of<MyController>(context, listen: false).fetchData();
  }

  Widget build(BuildContext context) {
    final MyControllerobj = Provider.of<MyController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Get News",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: MyControllerobj.newsapiobj.articles?.length,
          itemBuilder: (context, index) => HomeScreenWidget(
              title: MyControllerobj.newsapiobj.articles?[index].title ?? "",
              image:
                  MyControllerobj.newsapiobj.articles?[index].urlToImage ?? ""),
        ),
      ),
    );
  }
}
