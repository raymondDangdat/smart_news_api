import 'package:http/http.dart' as http;
import 'dart:convert';

// var _api_key = "AIzaSyDnWhtsbqtFQaJ6_rvCqBYElr_XeDIedKE";
// Future<http.Response> (String, text) async{
//   String url = "https://speech.googleapis.com/v1p1beta1/speech:recognize?key=$_api_key";
//
//   var body = jsonDecode(
//       {
//         "audio": {
//           "content": "/* Your audio */"
//         },
//         "config": {
//           "enableAutomaticPunctuation": true,
//           "encoding": "LINEAR16",
//           "languageCode": "en-US",
//           "model": "default"
//         }
//       }
//   );
// }