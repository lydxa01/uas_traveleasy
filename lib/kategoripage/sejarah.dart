import 'package:flutter/material.dart';

class SejarahPage extends StatelessWidget {
  final Sejarah sejarah;

  SejarahPage({required this.sejarah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tempat Bersejarah di Indonesia'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Tempat Bersejarah di Indonesia - ${sejarah.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1, // Since you're displaying a single historical site
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.asset(
                      sejarah.imagePath,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(sejarah.name),
                    subtitle: Text('Tahun Berdiri: ${sejarah.yearEstablished}'),
                    onTap: () {
                      // Action to be taken when the historical site is clicked
                      print("Anda mengklik ${sejarah.name}");
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

class Sejarah {
  final String name;
  final int yearEstablished;
  final String imagePath;

  Sejarah({
    required this.name,
    required this.yearEstablished,
    required this.imagePath,
  });
}

List<Sejarah> sejarahList = [
  Sejarah(
    name: 'Candi Borobudur',
    yearEstablished: 800,
    imagePath: 'assets/candi_borobudur.jpg',
  ),
  Sejarah(
    name: 'Candi Prambanan',
    yearEstablished: 850,
    imagePath: 'assets/candi_prambanan.jpg',
  ),
  // Add more historical sites as needed
];
