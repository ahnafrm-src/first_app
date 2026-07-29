import 'package:belajar_1/pages/metaAI.dart';
import 'package:flutter/material.dart';

class ButtonHome extends StatelessWidget {
  final page;
  const ButtonHome({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      style: ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.all(20))),
      child: Text('Meta AI'),
    );
  }
}
