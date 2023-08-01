import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';

class PesanTiket extends StatefulWidget {
  const PesanTiket({super.key});

  @override
  State<PesanTiket> createState() => _PesanTiketState();
}

class _PesanTiketState extends State<PesanTiket> {
  _PesanTiketState() {
    pilih = tiket[0];
    pdr = dari[0];
    ptj = tujuan[0];
  }
  final _tiketCtlr = TextEditingController();
  final _dariCtlr = TextEditingController();
  final _tujuanCtlr = TextEditingController();
  TextEditingController datetimeInput = TextEditingController();

  var dari = [
    '',
    'Surabaya',
    'Malang',
    'Sumenep',
    'Batam',
  ];
  String? pdr = '';

  var tujuan = [
    '',
    'Malang',
    'Batam',
    'Jakarta',
    'Surabaya',
  ];
  String? ptj = '';

  var tiket = ['Kereta', 'Bus'];
  String? pilih = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Pesan Tiket',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            Column(
              children: [
                DropdownButtonFormField(
                  value: pilih,
                  items: tiket
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      pilih = value.toString();
                    });
                  },
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField(
                  value: pdr,
                  items: dari
                      .map((dr) => DropdownMenuItem(
                            value: dr,
                            child: Text(dr),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      pdr = value.toString();
                    });
                  },
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField(
                  value: ptj,
                  items: tujuan
                      .map((tj) => DropdownMenuItem(
                            value: tj,
                            child: Text(tj),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      ptj = value.toString();
                    });
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: datetimeInput,
                  decoration: const InputDecoration(
                    hintText: 'Pilih Tanggal Hari',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide:
                          BorderSide(width: 1, style: BorderStyle.solid),
                    ),
                  ),
                  onTap: () async {
                    DateTime? pilihDatetime = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2050),
                    );
                    final waktu = DateTime.now().format();
                    if (pilihDatetime != null) {
                      setState(
                        () {
                          datetimeInput.text = DateTimeFormat.format(
                            pilihDatetime,
                            format: waktu,
                          );
                          // datetimeInput.text =
                          //     DateTimeFormat.format(pilihDatetime);
                        },
                      );
                    } else {
                      print("Pilih Datetime");
                    }
                  },
                ),
              ],
            ),
            SafeArea(
              child: ElevatedButton(
                child: const Text('Tambah'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
