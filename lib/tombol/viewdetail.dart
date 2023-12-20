import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uas_traveleasy/page/bayar.dart';
import 'package:flutter/material.dart';

class ViewDetail extends StatefulWidget {
  final String title;
  final String description;
  double rating;
  final List<String> comments;
  final double price;
  final String img;

  ViewDetail({
    required this.title,
    required this.description,
    required this.rating,
    required this.comments,
    required this.price,
    required this.img,
  });

  @override
  _ViewDetailState createState() => _ViewDetailState();
}

class _ViewDetailState extends State<ViewDetail> {
  TextEditingController commentController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Image.asset(
              widget.img,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              widget.description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Deskripsi Paket Travel:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Deskripsi paket travel akan ditampilkan di sini.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Rating: ${widget.rating}/5',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildComments(),
            SizedBox(height: 16.0),
            _buildCommentInput(),
            _buildRatingInput(),
            Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BayarPage()),
                    );
                  },
                  child: Text('Bayar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Komentar:',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        for (String comment in widget.comments)
          Text(
            '- $comment',
            style: TextStyle(fontSize: 16.0),
          ),
      ],
    );
  }

  Widget _buildCommentInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tambahkan Komentar:',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        TextField(
          controller: commentController,
          decoration: InputDecoration(
            hintText: 'Tulis komentar...',
          ),
        ),
        SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: () {
            setState(() {
              // Add the entered comment to the comments list
              widget.comments.add(commentController.text);
              // Clear the comment input field
              commentController.clear();
            });
          },
          child: Text('Kirim Komentar'),
        ),
      ],
    );
  }

  Widget _buildRatingInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Beri Rating (1-5):',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: ratingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Masukkan rating...',
                ),
              ),
            ),
            SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Parse the entered rating and ensure it's between 1 and 5
                  double enteredRating =
                      double.tryParse(ratingController.text) ?? 0.0;
                  if (enteredRating >= 1.0 && enteredRating <= 5.0) {
                    // Update the rating and calculate the average
                    widget.rating = (widget.rating * widget.comments.length +
                            enteredRating) /
                        (widget.comments.length + 1);
                  }
                  // Clear the rating input field
                  ratingController.clear();
                });
              },
              child: Text('Beri Rating'),
            ),
          ],
        ),
      ],
    );
  }
}
