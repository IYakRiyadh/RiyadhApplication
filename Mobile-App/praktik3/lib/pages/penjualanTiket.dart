import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:prak3/helper/dbHerlper.dart';
import 'package:prak3/models/model.dart';
import 'package:prak3/pages/view/tiketBus.dart';
import 'package:sqflite/sqflite.dart';

class PenjualanTiket extends StatefulWidget {
  const PenjualanTiket({super.key});
  // TiketModel nama;
  // TiketModel harga;
  // TiketModel dari;
  // TiketModel tujuan;
  // TiketModel jumlah;
  // TiketModel waktu;

  @override
  State<PenjualanTiket> createState() => PenjualanTiketState();
}

class PenjualanTiketState extends State<PenjualanTiket> {
  TiketDb dbHelper = TiketDb();
  late List<TiketModel> listTiket;
  int? count = 0;

  @override
  Widget build(BuildContext context) {
    if (listTiket == null) {
      listTiket = <TiketModel>[];
      updateListView();
    }
    final ukuran = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penjualan Tiket'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'TERSEDIA',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  // ListView addtiket() => ListView.builder(
  //       itemBuilder: (context, index) {
  //         return Container(
  //           child: Row(
  //             children: [
  //               Column(
  //                 children: [],
  //               )
  //             ],
  //           ),
  //         );
  //       },
  //     );

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;

      default:
        return Colors.yellow;
    }
  }

  // Returns the priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return const Icon(Icons.play_arrow);
      case 2:
        return const Icon(Icons.keyboard_arrow_right);

      default:
        return const Icon(Icons.keyboard_arrow_right);
    }
  }

  ListView getNoteListView() {
    // TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int posisi) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor:
                    getPriorityColor(this.listTiket[posisi].jumlahTiket),
              ),
              SafeArea(
                  child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      children: const [
                        Text('dari'),
                        Text('>>>'),
                        Text('dari'),
                      ],
                    ),
                  ),
                ],
              ))
            ],
          ),
        );
      },
    );
  }

  void _delete(BuildContext context, TiketModel tiketModel) async {
    int result = await dbHelper.hapusTiket(tiketModel.jumlahTiket);
    if (result != 0) {
      _showSnackBar(context, 'tiket berhasil di hapus');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void navigasKeInput(TiketModel tiket) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const TikatInput();
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.setDB();
    dbFuture.then((database) {
      Future<List<TiketModel>?> tiketListFuture = dbHelper.ambilListTiket();
      tiketListFuture.then((listTiket) {
        setState(() {
          this.listTiket = listTiket!;
          count = listTiket.length;
        });
      });
    });
  }
}
