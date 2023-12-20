import 'package:flutter/material.dart';

class UmbulPage extends StatelessWidget {
  final Umbul umbul;

  UmbulPage({required this.umbul});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Umbul di Indonesia'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Umbul di Indonesia - ${umbul.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1, // Since you're displaying a single spring
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.asset(
                      umbul.imagePath,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(umbul.name),
                    subtitle: Text('Kedalaman: ${umbul.depth} meter'),
                    onTap: () {
                      // Action to be taken when the spring is clicked
                      print("Anda mengklik ${umbul.name}");
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

class Umbul {
  final String name;
  final double depth;
  final String imagePath;

  Umbul({
    required this.name,
    required this.depth,
    required this.imagePath,
  });
}

List<Umbul> umbulList = [
  Umbul(
    name: 'Umbul Ponggok',
    depth: 15.5,
    imagePath: 'assets/umbul_ponggok.jpg',
  ),
  Umbul(
    name: 'Umbul Cokro',
    depth: 20.2,
    imagePath: 'assets/umbul_cokro.jpg',
  ),
  // Add more springs as needed
];
