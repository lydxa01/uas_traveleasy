import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String text;
  final String userId;
  final DateTime timestamp;

  Comment({
    required this.text,
    required this.userId,
    required this.timestamp,
  });
}

// Define CommentSection class
class CommentSection extends StatefulWidget {
  final String itemId;

  CommentSection({required this.itemId});

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display existing comments
        _buildComments(),

        // Add a new comment
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: 'Add a comment...',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _addComment();
              },
              child: Text('Add Comment'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildComments() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('comments')
          .doc(widget.itemId)
          .collection('item_comments')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        List<Comment> comments = snapshot.data!.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return Comment(
            text: data['text'],
            userId: data['userId'],
            timestamp: (data['timestamp'] as Timestamp).toDate(),
          );
        }).toList();

        return Column(
          children: comments.map((comment) {
            return ListTile(
              title: Text(comment.text),
              subtitle: Text('By ${comment.userId} at ${comment.timestamp}'),
            );
          }).toList(),
        );
      },
    );
  }

  void _addComment() {
    String commentText = _commentController.text.trim();

    if (commentText.isNotEmpty) {
      Comment newComment = Comment(
        text: commentText,
        userId: 'user123',
        timestamp: DateTime.now(),
      );

      FirebaseFirestore.instance
          .collection('comments')
          .doc(widget.itemId)
          .collection('item_comments')
          .add({
        'text': newComment.text,
        'userId': newComment.userId,
        'timestamp': newComment.timestamp,
      });

      _commentController.clear();
    }
  }
}