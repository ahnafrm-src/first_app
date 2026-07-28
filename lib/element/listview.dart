import 'package:flutter/material.dart';
import 'image_network.dart';

class Listview extends StatelessWidget {
  const Listview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(50, (index) => const ImageNetwork(isBox: false, urlImg: "https://i.pinimg.com/736x/17/a5/0a/17a50ae19d186c214799f6d888838af5.jpg",)
      ).toList(),
    );
  }
}
