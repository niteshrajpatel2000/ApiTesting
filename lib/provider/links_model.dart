import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';

class ApiEntry {
  final String api;
  final String link;

  ApiEntry({required this.api, required this.link});
}

class ApiProvider with ChangeNotifier {
  List<ApiEntry> _apiEntries = [];

  List<ApiEntry> get apiEntries => _apiEntries;

  Future<void> fetchApiData() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.publicapis.org/entries'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final entries = data['entries'] as List<dynamic>;

        _apiEntries = entries.map((entry) {
          return ApiEntry(api: entry['API'], link: entry['Link']);
        }).toList();

        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw error;
    }
  }
}
