
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../provider/links_function.dart';
import '../provider/links_model.dart';
import 'api_list.dart';



class ApiLinkPage extends StatefulWidget {
  const ApiLinkPage({super.key});

  @override
  _ApiLinkPageState createState() => _ApiLinkPageState();
}

class _ApiLinkPageState extends State<ApiLinkPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ApiProvider>(context, listen: false).fetchApiData();
  }


  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Task-2'),
          actions: [
          IconButton(
            onPressed: () {
             Get.to(const ApiList());
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: apiProvider.apiEntries.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: apiProvider.apiEntries.length,
        itemBuilder: (context, index) {
          final apiEntry = apiProvider.apiEntries[index];

          return ListTile(
            title: Text(apiEntry.api),
            subtitle: Text(apiEntry.link,style: const TextStyle(color: Colors.blueAccent),),
            onTap: () {
              openLink(apiEntry.link);
            },
          );
        },
      ),
    );
  }
}
