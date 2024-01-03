// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:daily_quote/constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>?> getMapData() async {
    try {
      final response = await http.get(Uri.parse(kURI + kEndpoint));

      if (response.statusCode == 200) {
        final parsedData = jsonDecode(response.body);
        print(parsedData.toString());
        return parsedData as Map<String, dynamic>;
      } else {
        print('API request failed with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
