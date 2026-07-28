import 'package:flutter/material.dart';
import '../element/button.dart';
import '../element/image_network.dart';
import '../element/listview.dart';
import '../element/chatWa.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.green[900],
        title: Text("Ahnaf Muafa", style: TextStyle(color: Colors.white)),
        leading: Padding(
          padding: EdgeInsetsGeometry.only(left: 10, bottom: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: ImageNetwork(
              isBox: true,
              urlImg:
                  "https://i.pinimg.com/736x/57/35/66/573566386f3f2f5d9d8b04700dc4cf92.jpg",
            ),
          ),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.green[400]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SizedBox(height: 200, width: size.width, child: Listview(),),
          Chatwa()
          ],
        ),
      ),
      floatingActionButton: ButtonHome(),
    );
  }
}
