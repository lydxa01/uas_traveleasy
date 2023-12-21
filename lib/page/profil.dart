import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uas_traveleasy/page/login.dart';
import 'package:uas_traveleasy/page/wishlist_page.dart';
import 'package:uas_traveleasy/page/AddToCart.dart';
import 'package:uas_traveleasy/page/history_pemesanan.dart'; // Import the history_pemesanan.dart file
import 'package:uas_traveleasy/page/pengaturan.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display user profile information
            SizedBox(height: 20),
            Text(
              'Profile Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Use the user's display name (nama) if available, otherwise use a default value
            Text(
              'Name: ${user?.displayName ?? "No Name"}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Email: ${user?.email ?? "No Email"}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            // Additional Personal Information
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to the AddToCart screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddToCart()),
                );
              },
              icon: Icon(Icons.add_shopping_cart),
              label: Text("Add to Cart"),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to the HistoryPemesanan screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HistoryPemesanan()), // Use HistoryPemesanan() here
                );
              },
              icon: Icon(Icons.history),
              label: Text("History Pemesanan"),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to the Pengaturan screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pengaturan()),
                );
              },
              icon: Icon(Icons.settings),
              label: Text("Pengaturan"),
            ),
            // Add more personal information widgets here (e.g., vouchers, help center, etc.)
          ],
        ),
      ),
    );
  }
}
