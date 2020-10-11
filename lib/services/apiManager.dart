import 'package:http/http.dart' as http;
import 'package:smart_news_api/constants/strings.dart';
class API_Manager{

  void getNews() async{
    var client  = http.Client();

    var response = await client.get(Strings.newsUrl);

    if(response.statusCode == 200){
      var jsonString = response.body;
    }
    
  }
}