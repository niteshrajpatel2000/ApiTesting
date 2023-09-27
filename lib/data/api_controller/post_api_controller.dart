import 'package:apicalling/data/model/user_responce_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// A controller class for managing user-related API calls and data using the GetX state management library.
class UserController extends GetxController {
  final _apiUrl = 'https://reqres.in/api/users';

  // Observable Rx variable to hold the user response data.
  Rx<UserResponseModel> userResponse = UserResponseModel().obs;

  /// Posts user details to the API.
  ///
  /// This function sends a POST request to the specified API endpoint with user details (name and job).
  /// It expects a successful response with a status code of 201 (Created).
  /// If successful, it updates the userResponse with the response data.
  ///
  /// Parameters:
  /// - [name]: The name of the user.
  /// - [job]: The job title of the user.
  ///
  /// Returns:
  /// - No return value, but updates the userResponse observable.
  Future<void> postUserDetails(String name, String job) async {
    final Map<String, dynamic> data = {
      'name': name,
      'job': job,
    };

    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        userResponse.value = UserResponseModel.fromJson(responseData);
        print('User Details Posted: $responseData');
      } else {
        // Handle the error when the API request does not return a 201 status code.
        print('Failed to post user details.');
      }
    } catch (error) {
      // Handle errors that occurred during the HTTP request.
      print('Error: $error');
    }
  }
}
