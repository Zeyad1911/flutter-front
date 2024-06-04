import 'package:flutter/material.dart';

class MySaved extends StatefulWidget {
  const MySaved({super.key});

  @override
  State<MySaved> createState() => _MySavedState();
}

class _MySavedState extends State<MySaved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text("My Saved"),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
          child: Container(
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: const [
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}