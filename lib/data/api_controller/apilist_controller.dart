import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../model/api_list_model.dart';

/// A controller class for managing API entries using the GetX state management library.
class EntryController extends GetxController {
  // Observable Rx variable to hold the API entries.
  Rx<ApiEntry> entries = ApiEntry().obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch entries from the API when this controller is initialized.
    fetchEntries();
  }

  /// Fetches data from a remote API and updates the entries list.
  Future<void> fetchEntries() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.publicapis.org/entries'));

      if (response.statusCode == 200) {
        // Decode the JSON response and update the entries with the parsed data.
        final data = json.decode(response.body);
        entries.value = ApiEntry.fromJson(data);
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (e) {
      // Handle any errors that occurred during the HTTP request.
      print('Error fetching data: $e');
    }
  }

  /// Deletes an entry from the entries list by index.
  ///
  /// If the index is valid and the entry exists, it is removed from the list.
  /// The entries list is then updated with the modified list.
  void deleteEntry(int index) {
    final entryList = entries.value.entries;
    if (entryList != null && index >= 0 && index < entryList.length) {
      entryList.removeAt(index);
      entries.value = ApiEntry(
          entries: entryList); // Create a new ApiEntry with the updated list
    }
  }
}
