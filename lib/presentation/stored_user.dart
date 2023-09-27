import 'package:flutter/material.dart';
import '../data/model/user_responce_model.dart';

class StoredUserScreen extends StatefulWidget {
  final UserResponseModel userRes;

  const StoredUserScreen({super.key, required this.userRes});

  @override
  State<StoredUserScreen> createState() => _StoredUserScreenState();
}

class _StoredUserScreenState extends State<StoredUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("User Details"),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: widget.userRes.name),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              'Job',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: widget.userRes.job),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              'ID',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: widget.userRes.id),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              'CreatAt',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: widget.userRes.createdAt),
            ),
          ),
        ],
      ),
    );
  }
}
