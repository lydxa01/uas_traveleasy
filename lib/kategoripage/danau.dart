import 'package:flutter/material.dart';

class DanauPage extends StatelessWidget {
  final Danau danau;

  const DanauPage({Key? key, required this.danau}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(danau.nama),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              danau.gambar,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Informasi Danau:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Nama: ${danau.nama}'),
            Text('Luas: ${danau.luas}'),
            // Add more information as needed
          ],
        ),
      ),
    );
  }
}

class Danau {
  final String nama;
  final double luas;
  final String gambar;

  Danau({
    required this.nama,
    required this.luas,
    required this.gambar,
  });
}

List<Danau> danauList = [
  Danau(
    nama: 'Danau Toba',
    luas: 1, // Replace with the actual area in km²
    gambar: 'assets/danau_toba.jpg',
  ),
  Danau(
    nama: 'Danau Sentani',
    luas: 0.123, // Replace with the actual area in km²
    gambar: 'assets/danau_sentani.jpg',
  ),
  // Add more lakes as needed
];
