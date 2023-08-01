import 'package:flutter/material.dart';

class TikatInput extends StatefulWidget {
  const TikatInput({super.key});

  @override
  State<TikatInput> createState() => _TikatInputState();
}

class _TikatInputState extends State<TikatInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              child: const Text(
                'Pesan Tiket',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  TextFormField(
                    // controller: _tiketCtlr,
                    decoration: const InputDecoration(
                      hintText: 'Tiket?',
                      hintStyle:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    // controller: _tujuanCtlr,
                    decoration: const InputDecoration(
                      hintText: 'Dari',
                      hintStyle:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextFormField(
                    // controller: _tiketCtlr,
                    decoration: const InputDecoration(
                      hintText: 'Tujuan',
                      hintStyle:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                    items: [],
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    // controller: _tujuanCtlr,
                    decoration: const InputDecoration(
                      hintText: 'Tujuan',
                      hintStyle:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
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
