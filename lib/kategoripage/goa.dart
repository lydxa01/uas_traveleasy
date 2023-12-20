import 'package:flutter/material.dart';

class GoaPage extends StatelessWidget {
  final Goa goa;

  GoaPage({required this.goa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goa di Indonesia'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Goa di Indonesia - ${goa.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1, // Since you're displaying a single cave
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.asset(
                      goa.imagePath,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(goa.name),
                    subtitle: Text('Panjang Goa: ${goa.length} meter'),
                    onTap: () {
                      // Action to be taken when the cave is clicked
                      print("Anda mengklik ${goa.name}");
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

class Goa {
  final String name;
  final int length;
  final String imagePath;

  Goa({
    required this.name,
    required this.length,
    required this.imagePath,
  });
}

List<Goa> goaList = [
  Goa(
    name: 'Goa Jomblang',
    length: 300,
    imagePath: 'assets/goa_jomblang.jpg',
  ),
  Goa(
    name: 'Goa Pindul',
    length: 1500,
    imagePath: 'assets/goa_pindul.jpg',
  ),
  // Add more caves as needed
];
