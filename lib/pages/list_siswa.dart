import 'package:belajar_1/model/msiswa.dart';
import 'package:belajar_1/api/api.dart';
import 'package:flutter/material.dart';

class ListSiswa extends StatefulWidget {
  final SiswaModel sw;
  const ListSiswa({super.key, required this.sw});

  @override
  State<ListSiswa> createState() => _ListSiswaState();
}

class _ListSiswaState extends State<ListSiswa> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}