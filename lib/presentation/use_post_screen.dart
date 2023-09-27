import 'package:apicalling/presentation/stored_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/api_controller/post_api_controller.dart';

class UserAdd extends StatefulWidget {
  const UserAdd({super.key});

  @override
  State<UserAdd> createState() => _UserAddState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _UserAddState extends State<UserAdd> {
  final UserController userController = Get.put(UserController());
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _jobTitleEditingController =
      TextEditingController();

  // Function to add a user when a button is pressed
  void onAddUserButtonPressed() {
    var name = _nameEditingController.text.toString();
    var job = _jobTitleEditingController.text.toString();

    userController.postUserDetails(name, job).then((value) {
      if (userController.userResponse.value.name != null) {
        var res = userController.userResponse.value;
        Get.to(StoredUserScreen(userRes: res));
      } else {
        Get.snackbar("Network error", "Error");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Task-4'),
      ),
      body: Center(
        child: Form(
          key: _formKey, // Assign the GlobalKey
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child:
                    Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
                child: TextFormField(
                  controller: _nameEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: "Enter Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child:
                    Text('Job', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
                child: TextFormField(
                  controller: _jobTitleEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: "Job Title",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a job title';
                    }
                    return null;
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        // Validate the form before performing the action
                        if (_formKey.currentState!.validate()) {
                          // The form is valid, continue with your action
                          onAddUserButtonPressed();
                        }
                      },
                      child: const Text('Post',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
