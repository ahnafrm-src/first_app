import 'package:flutter/material.dart';

class Chatwa extends StatelessWidget {
  const Chatwa({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 100,
      width: size.width,
      color: Color(0xFF1F2C34),
      padding: EdgeInsets.all(10),
      child: Row(
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
          Text('yesterday', style: TextStyle(color: Colors.grey),),
        ],
      ),
    );
  }
}
