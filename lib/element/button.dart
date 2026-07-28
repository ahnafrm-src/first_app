import 'package:flutter/material.dart';

class ButtonHome extends StatelessWidget {
  const ButtonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {debugPrint('tombol ditekan di debug');}, child: Text('TEKAN'));
  }
}