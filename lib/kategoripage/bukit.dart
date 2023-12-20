import 'package:flutter/material.dart';

class BukitPage extends StatelessWidget {
  final Bukit bukit;

  BukitPage({required this.bukit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bukit di Indonesia'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Bukit di Indonesia - ${bukit.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1, // Since you're displaying a single hill
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.asset(
                      bukit.imagePath,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(bukit.name),
                    subtitle: Text('Ketinggian: ${bukit.height} meter'),
                    onTap: () {
                      // Action to be taken when the hill is clicked
                      print("Anda mengklik ${bukit.name}");
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Bukit {
  final String name;
  final int height;
  final String imagePath;

  Bukit({
    required this.name,
    required this.height,
    required this.imagePath,
  });
}

List<Bukit> bukitList = [
  Bukit(
    name: 'Bukit Teletubbies',
    height: 500,
    imagePath: 'assets/bukit_teletubbies.jpg',
  ),
  Bukit(
    name: 'Bukit Merbabu',
    height: 3142,
    imagePath: 'assets/bukit_merbabu.jpg',
  ),
  // Add more hills as needed
];
