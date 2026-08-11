import 'package:belajar_1/pages/chat_page.dart';
import 'package:flutter/material.dart';

import '../data/chat_data.dart';

class Chatwa extends StatelessWidget {
  final String read;
  final ChatData chatData;
  Chatwa({super.key, required this.read, required this.chatData});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(chatData: chatData,)));
      },
      child: Ink(
        color: Colors.transparent, 
        height: double.infinity,   
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                chatData.img,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      chatData.name,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Row(
                      children: [
                        Icon(Icons.check, size: 20, color: Colors.blueAccent),
                        Text('oke baik', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Text(read, style: TextStyle(color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}














