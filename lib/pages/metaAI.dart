import 'package:belajar_1/pages/home.dart';
import 'package:flutter/material.dart';

import '../element/button.dart';
import 'biodata.dart';

class MetaAi extends StatelessWidget {
  const MetaAi({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.green[900],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            width: size.height,
            height: 100,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  iconSize: 50,
                ),
                Text(
                  'Halaman Meta AI',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Text("Meta AI"),
                TextField(decoration: InputDecoration(label: Text("pesan")),),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Biodata()));
                  },
                  child: Text('kirim', style: TextStyle(color: Colors.black),),
                  style: ButtonStyle(
                    fixedSize: WidgetStateProperty.all(Size(400, 50)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10))),
                    backgroundColor: WidgetStateProperty.all(Colors.green[200])
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
