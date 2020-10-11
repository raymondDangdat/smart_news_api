import 'package:flutter/material.dart';
import 'package:smart_news_api/news.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loadingInProgress;
  var newsList;

  Future<void> getNews() async {
    News news = News();
    await news.getNews();
    setState(() {
      _loadingInProgress = false;
      newsList = news.news;
    });
  }

  @override
  void initState() {
    _loadingInProgress = true;
    // TODO: implement initState
    super.initState();

    //  Function to get news
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Center(
            child: Text("Smart News"),
          ),
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: _loadingInProgress
                    ? Center(
                        child: Text("Loading...", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),),
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              Text("Top Headlines", style: TextStyle(
                                color: Colors.black,
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                              ),)
                            ],
                          ),
                          Divider(
                            color: Colors.blue,
                          ),
                          //Get all news
                          Expanded(
                            child: ListView.builder(
                              itemCount: newsList.length,
                                itemBuilder: (context, index){
                                  return ListTile(
                                    title: Text(newsList[index].title),
                                    leading: Image.network(newsList[index].urlToImage),
                                    subtitle: Text(DateFormat.Hm().format(newsList[index].publishedAt)),
                                  );
                                }),
                          )
                        ],
                      ))));
  }
}
