import 'dart:convert';

import 'package:http/http.dart' as http;

class requestAssist
{
  static Future<dynamic> getRequest(String url) async
  {
    http.Response response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        String jSonData = response.body; //Json data
        var decodeData = jsonDecode(jSonData);
        return decodeData;
      }
      else {
        return "ERROR: Failed to respond...";
      }
    }
    catch(exp) {
      return "FAILED...";

    }
  }
}