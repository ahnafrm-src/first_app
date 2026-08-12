import 'package:belajar_1/pages/biodata.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:belajar_1/api/api.dart';
import 'package:belajar_1/model/msiswa.dart';
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

  Future createSw() async {
    return await http.post(
      Uri.parse(BaseUrl.tambah),
      body: {
        "nis": nisController.text,
        "nama": namaController.text,
        "tplahir": tpController.text,
        "tglahir": tgController.text,
        "kelamin": kelaminController.text,
        "agama": agamaController.text,
        "alamat": alamatController.text,
      },
    );
  }

  void _onConfirm(context) async {
    http.Response response = await createSw();
    final data = json.decode(response.body);
    if (data['success']) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Biodata()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah siswa'),
        centerTitle: true,
        backgroundColor: Colors.green[400],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            if (formkey.currentState!.validate()) {
              print("OK MANTAP");
              _onConfirm(context);
            }
          },
          child: Text('Simpan'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.green,
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  controller: nisController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'NIS',
                    prefixIcon: Icon(Icons.card_membership),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukkan NIS Kelahiran Anda.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                // NAMA
                TextFormField(
                  controller: namaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'NAMA',
                    prefixIcon: Icon(Icons.note),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukkan Nama Anda.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                // TEMPAT LAHIR
                TextFormField(
                  controller: tpController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Tempat Lahir',
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukkan Kota Kelahiran Anda.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                // TANGGAL LAHIR
                TextFormField(
                  readOnly: true,
                  controller: tgController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today),
                    labelText: 'Tanggal Lahir',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onTap: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 150),
                      lastDate: DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                      ),
                    ).then((tglahir) {
                      if (tglahir != null) {
                        tgController.text =
                            "${tglahir.year}-${tglahir.month.toString().padLeft(2, '0')}-${tglahir.day.toString().padLeft(2, '0')}";
                      }
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan Tanggal Lahir Anda.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                // kelamin
                TextFormField(
                  controller: kelaminController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Jenis Kelamin',
                    prefixIcon: Icon(Icons.social_distance),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Masukan Jenis Kelamin Anda";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                TextFormField(
                  controller: agamaController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mosque),
                    labelText: 'Agama',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukkan Agama Anda.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                // ALAMAT
                TextFormField(
                  controller: alamatController,
                  decoration: InputDecoration(
                    labelText: 'Alamat',
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Silahkan Masukkan Alamat Anda.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
