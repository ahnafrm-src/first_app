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
        title: Text("list biodata siswa"),
        centerTitle: true,
        backgroundColor: Colors.green[400],
      ),
      body: Center(
        child: FutureBuilder<List<SiswaModel>>(
          future: sw,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data![index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.view_list),
                    title: Text(
                      data.nis + " " + data.nama,
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(data.tplahir + "," + data.tglahir),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        hoverColor: Colors.green[800],
        backgroundColor: Colors.green[500],
      ),
    );
  }
}
