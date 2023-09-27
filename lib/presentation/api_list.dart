import 'package:apicalling/presentation/use_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/api_controller/apilist_controller.dart';

class ApiList extends StatefulWidget {
  const ApiList({super.key});

  @override
  State<ApiList> createState() => _ApiListState();
}

class _ApiListState extends State<ApiList> {
  final EntryController entryController = Get.put(EntryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task-3'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const UserAdd());
            },
            icon: const Icon(Icons.arrow_forward),
          )
        ],
      ),
      body: Obx(() {
        final entries = entryController.entries.value.entries;
        if (entries == null) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
          );
        }

        return ListView.builder(
          itemCount: entries.length,
          itemBuilder: (context, index) {
            final entry = entries[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "API: " "${entry.api}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              entryController.deleteEntry(index);
                            },
                            icon: const Icon(Icons.delete, color: Colors.red),
                          )
                        ],
                      ),
                      Text("Auth:   ${entry.auth}"),
                      Text("Category:  ${entry.category}"),
                      Text("Cors:   ${entry.cors}"),
                      Text("HTTPS:  ${entry.https}"),
                      Text("Link:  ${entry.link}"),
                      Text("Description:  ${entry.description}"),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
