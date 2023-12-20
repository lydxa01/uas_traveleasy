import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uas_traveleasy/tombol/viewdetail.dart';

class Promo extends StatefulWidget {
  const Promo({Key? key}) : super(key: key);

  @override
  State<Promo> createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  var collection = FirebaseFirestore.instance.collection("promos");
  late List<Map<String, dynamic>> promo;
  bool isLoaded = false;

  _incrementCounter() async {
    try {
      List<Map<String, dynamic>> tempList = [];
      var data = await collection.get();
      data.docs.forEach((element) {
        tempList.add(element.data() as Map<String, dynamic>);
      });

      setState(() {
        promo = tempList;
        isLoaded = true;
      });
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Promo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: isLoaded
              ? promo.map((item) {
                  return Card(
                    elevation: 5.0,
                    child: Column(
                      children: [
                        Image.asset(
                          item['image'],
                          height: 150.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item['title'],
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item['description'],
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to the ViewDetail page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewDetail(
                                  title: item['title'],
                                  description: item['description'],
                                  rating: (item['rating'] is int)
                                      ? (item['rating'] as int).toDouble()
                                      : (item['rating'] as double),
                                  comments: [item['comments'] as String],
                                  price: (item['price'] is int)
                                      ? (item['price'] as int).toDouble()
                                      : (item['price'] as double),
                                            img: item['image'] as String, // Provide the image URL

                                ),
                              ),
                            );
                          },
                          child: Text('View Details'),
                        ),
                      ],
                    ),
                  );
                }).toList()
              : [Text('Loading...')],
        ),
      ),
    );
  }
}
