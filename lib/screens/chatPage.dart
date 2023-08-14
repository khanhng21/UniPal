import 'package:flutter/material.dart';
import 'package:uni_pal/widgets/conversationList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

String generateConversationID() {
  final uuid = Uuid();
  return uuid.v4();
}

class ChatPage extends StatefulWidget {
  final String conversationID;

  ChatPage({required this.conversationID});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController messageController = TextEditingController();
  List<String> conversations = [];

  void deleteConversation(String conversationID) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Delete the conversation document from Firestore
    await firestore.collection('messages').doc(conversationID).delete();

    // Remove the conversation ID from the local list
    setState(() {
      conversations.remove(conversationID);
    });
  }

  void sendMessage(String message) async {
    final timestamp = Timestamp.now();
    final formattedTimestamp =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(timestamp.toDate());

    await firestore.collection('messages').add({
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });

    messageController.clear();

    print('Message sent at: $formattedTimestamp');
  }

  void startNewConversation() async {
    final senderID = 'whoever'; // Replace with the actual sender ID
    final receiverID = 'khanhng'; // Replace with the actual receiver ID

    // Create a new conversation document
    final newConversation = await firestore.collection('messages').add({
      'whoever': senderID,
      'khanhng': receiverID,
      'timestamp': DateTime.now(),
    });

    final conversationID = newConversation.id;

    // Navigate to chat page and pass the conversation ID
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChatPage(conversationID: conversationID)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Delete Conversation'),
                    content: Text(
                        'Are you sure you want to delete this conversation?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          deleteConversation(widget
                              .conversationID); // Call the deleteConversation method
                          Navigator.pop(context); // Close the dialog
                          Navigator.pop(
                              context); // Navigate back to the previous screen
                        },
                        child: Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: TextStyle(color: Colors.grey.shade600),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey.shade600,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey.shade100),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: startNewConversation, // Add new conversation
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.pink,
                            size: 20,
                          ),
                          SizedBox(width: 2),
                          Text(
                            "Add New",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('messages').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final conversations = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: conversations.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final conversation =
                          conversations[index].data() as Map<String, dynamic>?;
                      final name = conversation?['name'] as String? ?? '';
                      final message = conversation?['message'] as String? ?? '';
                      final timestamp =
                          (conversation?['timestamp'] as Timestamp?)
                                  ?.toDate() ??
                              DateTime.now();
                      final formattedTimestamp = timestamp != null
                          ? DateFormat('MMM dd, yyyy - hh:mm a')
                              .format(timestamp)
                          : '';
                      final conversationID = conversations[index].id;

                      return ConversationList(
                        conversationID: conversationID,
                        name: name,
                        messageText: message,
                        imageURL: AssetImage('assets/images/userImage1.jpeg'),
                        time: formattedTimestamp,
                        isMessageRead: false,
                        onDeleteConversation:
                            deleteConversation, // Pass the deleteConversation function
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
