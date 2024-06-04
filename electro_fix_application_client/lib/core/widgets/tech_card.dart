import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_fix_application/core/widgets/request_button.dart';
import 'package:electro_fix_application/core/widgets/save_button.dart';
import 'package:electro_fix_application/features/chat/chat_screen.dart';
import 'package:flutter/material.dart';

class TechnicianCard extends StatefulWidget {
  const TechnicianCard(
      {super.key, required this.technician, required this.userID});
  final String? userID;
  final DocumentSnapshot technician;

  @override
  State<TechnicianCard> createState() => _TechnicianCardState();
}

class _TechnicianCardState extends State<TechnicianCard> {
  Future<void> startChat() async {
    //  for development /////////////////////////////////////////////////////////////////
    if (widget.userID == null) {
      print('User ID is null');

      return;
    }
    ////////////////////////////////////////////////////////////////////////////////////
    String currentUserID = widget.userID!;
    String technicianID = widget.technician.id;

    CollectionReference chatRooms =
        FirebaseFirestore.instance.collection("ChatRooom");

    QuerySnapshot chatRoomSnapshot = await chatRooms
        .where('participants', arrayContains: currentUserID)
        .get();

    DocumentSnapshot? chatRoom;

    for (var doc in chatRoomSnapshot.docs) {
      List<String> participant = doc.get('participants');
      if (participant.contains(technicianID)) {
        chatRoom = doc;
        break;
      }
    }

    if (chatRoom == null) {
      DocumentReference newChatRoom = await chatRooms.add({
        'participants': [currentUserID, technicianID],
        'createdAt': FieldValue.serverTimestamp(),
      });
      chatRoom = await newChatRoom.get();
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Chat(
          chatRoomId: chatRoom!.id,
          userID: currentUserID,
          technicianID: technicianID,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.teal,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.technician.get("username"),
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.technician.get("location") +
                          " , " +
                          widget.technician.get("specialization"),
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              " Bio ",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: startChat,
                  child: Text('Chat'),
                ),
              ]
                ),

            const SizedBox(height: 8),    

            const Row(
              children: [
                RequestButton(name: "Request"),
                SizedBox(
                  width: 30,
                ),
                SaveButton(name: "Save")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
