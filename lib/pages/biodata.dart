import 'package:belajar_1/pages/siswa_add.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:belajar_1/api/api.dart';
import 'package:belajar_1/model/msiswa.dart';

import 'package:http/http.dart' as http;

class Biodata extends StatefulWidget {
  const Biodata({super.key});

  @override
  State<Biodata> createState() => BiodataState();
}

class BiodataState extends State<Biodata> {
  late Future<List<SiswaModel>> sw;
  final swListKey = GlobalKey<BiodataState>();

  @override
  void initState() {
    super.initState();
    sw = getSwList();
  }

  Future<List<SiswaModel>> getSwList() async {
    final response = await http.get(Uri.parse(BaseUrl.data));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<SiswaModel> sw = items.map<SiswaModel>((json) {
      return SiswaModel.fromJson(json);
    }).toList();

    return sw;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("list biodata siswa"),
        centerTitle: true,
        backgroundColor: Colors.green[400],
      ),
      body: Center(
        // 1. Tambahkan tipe data <List<SiswaModel>> di FutureBuilder
        child: FutureBuilder<List<SiswaModel>>(
          future: sw,
          builder:
              (BuildContext context, AsyncSnapshot<List<SiswaModel>> snapshot) {
                // 2. Tambahkan pengecekan jika terjadi error pada koneksi/API
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }

                // 3. Tampilkan loading jika data belum siap
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }

                // 4. Jika data kosong (array [] dari PHP)
                if (snapshot.data!.isEmpty) {
                  return const Text("Tidak ada data siswa.");
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot.data![index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        trailing: const Icon(Icons.view_list),
                        title: Text(
                          "${data.nis} ${data.nama}", // Menggunakan string interpolation lebih aman
                          style: const TextStyle(fontSize: 20),
                        ),
                        subtitle: Text("${data.tplahir}, ${data.tglahir}"),
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ListSiswa()));
                        },
                      ),
                    );
                  },
                );
              },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SiswaAdd()));
        },
        hoverColor: Colors.green[800],
        backgroundColor: Colors.green[500],
        child: const Icon(Icons.add),
      ),
    );
  }
}
