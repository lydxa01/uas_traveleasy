import 'package:flutter/material.dart';

class PantaiPage extends StatelessWidget {
  final Pantai pantai;

  PantaiPage({required this.pantai});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantai di Indonesia'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Pantai di Indonesia - ${pantai.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1, // Since you're displaying a single beach
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.asset(
                      pantai.imagePath,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(pantai.name),
                    subtitle: Text('Jumlah Pasir: ${pantai.jumlahPasir}'),
                    onTap: () {
                      // Action to be taken when the beach is clicked
                      print("Anda mengklik ${pantai.name}");
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

class Pantai {
  final String name;
  final int jumlahPasir;
  final String imagePath;

  Pantai({
    required this.name,
    required this.jumlahPasir,
    required this.imagePath,
  });
}

List<Pantai> pantaiList = [
  Pantai(
    name: 'Pantai Kuta',
    jumlahPasir: 5000,
    imagePath: 'assets/pantai_kuta.jpg',
  ),
  Pantai(
    name: 'Pantai Parangtritis',
    jumlahPasir: 8000,
    imagePath: 'assets/pantai_parangtritis.jpg',
  ),
  // Add more beaches as needed
];
