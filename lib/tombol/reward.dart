import 'package:flutter/material.dart';
import 'package:uas_traveleasy/resources/large_text.dart';

class RewardPg extends StatefulWidget {
  const RewardPg({super.key});

  @override
  State<RewardPg> createState() => _RewardPgState();
}

class _RewardPgState extends State<RewardPg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: LText(text: "Ini adalah Halaman Reward"),
      ),
    );
  }
}