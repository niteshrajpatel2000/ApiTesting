import 'package:apicalling/data/api_controller/random_user_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'apilink_list.dart';

class RandomUserScreen extends StatefulWidget {
  const RandomUserScreen({super.key});

  @override
  State<RandomUserScreen> createState() => _RandomUserScreenState();
}

class _RandomUserScreenState extends State<RandomUserScreen> {
  final RandomUserController randomUserApiController =
      Get.put(RandomUserController());

  @override
  void initState() {
    randomUserApiController.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task-1'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const ApiLinkPage());
            },
            icon: const Icon(Icons.arrow_forward),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            final randomUser = randomUserApiController.randomUser.value;
            return (randomUser.results != null &&
                    randomUser.results!.isNotEmpty)
                ? ListView(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CarouselSlider(
                            items: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(randomUser
                                            .results?[0].picture?.medium ??
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRffJjJmZI0V-3zFma1J4RW7sEWf7mtnBu7fBIUCuL3gA&s'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(randomUser
                                            .results?[0].picture?.large ??
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRffJjJmZI0V-3zFma1J4RW7sEWf7mtnBu7fBIUCuL3gA&s'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(randomUser
                                            .results?[0].picture?.thumbnail ??
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRffJjJmZI0V-3zFma1J4RW7sEWf7mtnBu7fBIUCuL3gA&s'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                            options: CarouselOptions(
                              height: 250.0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              // autoPlayCurve: Curves.fastOutSlowIn,
                              // enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 600),
                              // viewportFraction: 0.8,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Divider(
                          color: Colors.blue,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    hintText:
                                        randomUser.results?[0].name?.title),
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Add space of 10 units between widgets
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    hintText:
                                        randomUser.results?[0].name?.first),
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Add space of 10 units between widgets
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    hintText:
                                        randomUser.results?[0].name?.last),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          'Gender',
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
                              hintText: randomUser.results?[0].gender),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'DOB',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    hintText: randomUser
                                        .results?[0].dob?.date.timeZoneName),
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Add space of 10 units between widgets
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    hintText: randomUser.results?[0].dob?.age
                                        .toString()),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          'Email',
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
                              hintText: randomUser.results?[0].email),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          'Phone',
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
                              hintText: randomUser.results?[0].phone),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          'Cell',
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
                              hintText: randomUser.results?[0].cell),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Location',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    hintText: randomUser
                                        .results?[0].location?.street.name),
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Add space of 10 units between widgets
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    hintText: randomUser
                                        .results?[0].location?.street.number
                                        .toString()),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          'State',
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
                              hintText: randomUser.results?[0].location?.state),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          'City',
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
                              hintText: randomUser.results?[0].location?.city),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          'PastCode',
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
                              hintText: randomUser
                                  .results?[0].location?.postcode
                                  .toString()),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          'Country',
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
                              hintText:
                                  randomUser.results?[0].location?.country),
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(
                    color: Colors.blue,
                  ));
          })),
    );
  }
}
