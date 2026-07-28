import 'package:flutter/material.dart';

class Chatwa extends StatelessWidget {
  final String read;
  Chatwa({super.key, required this.read});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            "https://i.pinimg.com/736x/1f/5d/ec/1f5dec2772605ebdb412fff7827fb764.jpg",
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
                  'Feril maulana henry',
                  style: TextStyle(color: Colors.white),
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
    );
  }
}
