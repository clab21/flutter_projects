import 'package:flutter/material.dart';

enum JenisKelamin {undefined, male, female}
enum JP {undefined, ti, si}

class TambahMahasiswa extends StatefulWidget {
  const TambahMahasiswa({Key? key}) : super(key: key);

  @override
  State<TambahMahasiswa> createState() => _TambahMahasiswaState();
}

class _TambahMahasiswaState extends State<TambahMahasiswa> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String jenisKelamin = 'Undefined';
  String jP = 'Undefined';
  final _nimController = TextEditingController();
  final _namaController = TextEditingController();
  late JenisKelamin _jenisKelamin = JenisKelamin.undefined;
  final JP _jP = JP.undefined;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Data Mahasiswa"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nimController,
                decoration: const InputDecoration(
                    hintText: 'Enter your NIM', labelText: 'NIM'),
              ),
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                    hintText: 'Enter your Name', labelText: 'Full Name'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
