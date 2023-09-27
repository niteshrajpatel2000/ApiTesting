import 'package:apicalling/data/model/random_user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// A controller class for fetching random user data from the RandomUser.me API
class RandomUserController extends GetxController {
  // Observable Rx variable to hold the random user data.
  Rx<RandomUser> randomUser = RandomUser(results: []).obs;

  /// Fetches random user data from the RandomUser.me API.
  /// This function sends a GET request to the RandomUser.me API to retrieve random user data.
  /// If the request is successful (status code 200), it parses the JSON response and updates
  /// the randomUser observable with the fetched data.
  ///
  /// In case of any errors during the HTTP request or if the API returns a non-200 status code,
  /// appropriate error messages are printed to the console.
  ///
  /// Returns:
  /// - No return value, but updates the randomUser observable with fetched data.
  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://randomuser.me/api/'));

      if (response.statusCode == 200) {
        final jsonResult = json.decode(response.body);
        final user = RandomUser.fromJson(jsonResult);

        randomUser.value = user;
      } else {
        // Handle API request failure with a non-200 status code.
        print('API request failed with status code ${response.statusCode}');
      }
    } catch (error) {
      // Handle errors that occurred during the HTTP request.
      print('Error during API request: $error');
    }
  }
}
