import 'package:electro_fix_application/core/widgets/card_post.dart';
import 'package:flutter/material.dart';

class MyPosts extends StatefulWidget {
  const MyPosts({super.key, this.userID});

    final String? userID;


  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text("My Posts"),
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
                CardPost(
                  userName: "Farha Essam",
                  deviceType: "Air conditioner",
                  deviceDescription:
                      "These examples are programmatically compiled from various online sources to illustrate current usage of word description, Any opinions expressed in the examples don't represent those of merriem webster or its editors. Send us feedback about these examples",
                  location: "Cairo",
                  address: "32 atta allah hana, shobra ",
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
