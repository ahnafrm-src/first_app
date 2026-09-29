import 'package:belajar_1/model/msiswa.dart';
import 'package:belajar_1/api/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:belajar_1/pages/biodata.dart';

class ListSiswa extends StatefulWidget {
  final SiswaModel sw;
  const ListSiswa({super.key, required this.sw});

  @override
  State<ListSiswa> createState() => ListSiswaState();
}

class ListSiswaState extends State<ListSiswa> {
  // Fungsi Hapus Siswa ke Database
  Future<void> deleteSiswa() async {
    try {
      final response = await http.post(
        Uri.parse(BaseUrl.hapus),
        body: {'id': widget.sw.id.toString()},
      );

      final data = json.decode(response.body);

      if (data['success'] == true) {
        Fluttertoast.showToast(
          msg: "Data berhasil dihapus",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        Navigator.of(context).pop(true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Gagal menghapus: ${data['message']}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error koneksi: $e")));
    }
  }

  // Dialog Konfirmasi Hapus Data
  void confirmDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Konfirmasi Hapus"),
          content: Text(
            "Apakah Anda yakin ingin menghapus data ${widget.sw.nama}?",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Batal"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.of(context).pop();
                deleteSiswa();
              },
              child: Text("Hapus", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sw.nama),
        actions: [
          IconButton(
            onPressed: () {
              confirmDelete();
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('NIS: ${widget.sw.nis}'),
                SizedBox(height: 20),

                Text('Alamat: ${widget.sw.alamat}'),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          confirmDelete();
        },
        hoverColor: Colors.green[800],
        backgroundColor: Colors.green[500],
        child: Text("edit"),
      ),
    );
  }
}
