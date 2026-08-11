import 'package:flutter/material.dart';

import '../data/chat_data.dart';

class ChatPage extends StatelessWidget {
  final ChatData chatData;
  const ChatPage({super.key, required this.chatData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B141A),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(chatData.img)),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(chatData.name, style: TextStyle(fontSize: 20)),
                  Text(
                    '18.22',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        toolbarHeight: 60,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 30,
        ),
        actions: [
          Icon(Icons.videocam, size: 30),
          SizedBox(width: 10),
          Icon(Icons.call, size: 30),
          SizedBox(width: 10),
          Icon(Icons.more_vert, size: 30),
          SizedBox(width: 15),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 220 + 4.4,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Color(0xFF0B141A),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Row(
                children: [
                  Text(
                    chatData.message,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "15.20",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 550),
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 16, 30, 39),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.emoji_emotions,
                            size: 25,
                            color: Colors.white,
                          ),
                          Text(
                            "Ketik pesan",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
