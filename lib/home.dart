import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_projects/tambah_mahasiswa.dart';
import 'package:flutter_projects/model/mahasiswa_model.dart';
import 'package:flutter_projects/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<MahasiswaModel>? _mahasiswaModel = [];
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void didChanged() {
    super.didChangeDependencies();
    _getData();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(_scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn);
    });
  }

  void _getData() async {
    _mahasiswaModel = (await ApiService().getMahasiswas())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('STMIK Pontianak'),
      ),
      body: _mahasiswaModel == null || _mahasiswaModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              controller: _scrollController,
              itemCount: _mahasiswaModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child:
                            _mahasiswaModel![index].jenisKelamin == "Perempuan"
                                ? const Image(
                                    image: AssetImage("assets/girl.png"),
                                    height: 40,
                                  )
                                : const Image(
                                    image: AssetImage("assets/boy.png"),
                                    height: 35,
                                  ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: screenSize.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _mahasiswaModel![index].nama,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_mahasiswaModel![index].jenisKelamin),
                                Text(_mahasiswaModel![index].nim),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(35, 101, 207, 1),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(5),
                        child: Center(
                          child:
                              Text(_mahasiswaModel![index].jp.substring(0, 2),
                                  style: const TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontWeight: FontWeight.bold,
                                  )),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: FloatingActionButton(
              onPressed: didChanged,
              heroTag: "fab1",
              child: const Icon(Icons.refresh),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TambahMahasiswa()),
              );
            },
            heroTag: "fab2",
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
