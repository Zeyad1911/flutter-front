import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_fix_application/features/chat/fetch_tech_name.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat(
      {super.key,
      required this.chatRoomId,
      required this.userID,
      required this.technicianID});

  final String chatRoomId;
  final String userID;
  final String technicianID;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _messageController = TextEditingController();
  String? technicianName;

  @override
  void initState() {
    super.initState();
    fetchTechnicianName();
  }

  Future<void> fetchTechnicianName() async {
    String? name = await getTechnicianName(widget.technicianID);
    setState(() {
      technicianName = name;
    });
  }

  Future<void> sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      CollectionReference messages = FirebaseFirestore.instance
          .collection("ChatRoom")
          .doc(widget.chatRoomId)
          .collection("messages");

      await messages.add({
        "addtime": FieldValue.serverTimestamp(),
        "contnent": _messageController.text,
        "senderID": widget.userID
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with ${technicianName ?? 'Technician'}"),
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('ChatRoom')
                  .doc(widget.chatRoomId)
                  .collection('messages')
                  .orderBy('addtime', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                var messages = snapshot.data!.docs;
                return ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      var message = messages[index];
                      bool isMe = message['senderID'] == widget.userID;
                      return ListTile(
                          title: Align(
                        alignment:
                            isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.blue : Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            message['content'],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ));
                    });
              }),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Send message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ]))
        ],
      ),
    );
  }
}
