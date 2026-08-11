import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:belajar_1/api/api.dart';
import 'package:intl/intl.dart';

class SiswaAdd extends StatefulWidget {
  const SiswaAdd({super.key});

  @override
  State<SiswaAdd> createState() => SiswaAddState();
}

class SiswaAddState extends State<SiswaAdd> {
  final formkey = GlobalKey<FormState>();
  final nisController = TextEditingController();
  final namaController = TextEditingController();
  final tpController = TextEditingController();
  final tgController = TextEditingController();
  final kelaminController = TextEditingController();
  final agamaController = TextEditingController();
  final alamatController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
