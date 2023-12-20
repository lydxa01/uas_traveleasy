import 'package:flutter/material.dart';

class CurugPage extends StatelessWidget {
  final Curug curug;

  CurugPage({required this.curug});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curug di Indonesia'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Curug di Indonesia - ${curug.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1, // Since you're displaying a single waterfall
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.asset(
                      curug.imagePath,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(curug.name),
                    subtitle: Text('Ketinggian: ${curug.height} meter'),
                    onTap: () {
                      // Action to be taken when the waterfall is clicked
                      print("Anda mengklik ${curug.name}");
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

class Curug {
  final String name;
  final int height;
  final String imagePath;

  Curug({
    required this.name,
    required this.height,
    required this.imagePath,
  });
}

List<Curug> curugList = [
  Curug(
    name: 'Curug Cimahi',
    height: 87,
    imagePath: 'assets/curug_cimahi.jpg',
  ),
  Curug(
    name: 'Curug Malela',
    height: 25,
    imagePath: 'assets/curug_malela.jpg',
  ),
  // Add more waterfalls as needed
];
