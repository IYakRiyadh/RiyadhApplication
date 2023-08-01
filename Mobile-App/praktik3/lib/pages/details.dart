import 'package:flutter/material.dart';
import 'package:prak3/models/modelLocal.dart';
import 'package:prak3/service/serviceApi.dart';

class DetailItem extends StatelessWidget {
  final MenuModel menumebel;

  const DetailItem({
    Key? key,
    required this.menumebel,
  }) : super(key: key);
  // const DetailItem({super.key, required MenuModel menumebel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const PageScrollPhysics().parent,
        child: Stack(children: [
          Stack(children: [
            Container(
                height: 300,
                decoration: BoxDecoration(color: Colors.teal[400])),
          ]),
          Column(children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      radius: 20,
                      onTap: () {
                        Navigator.of(context).pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Detail Item',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.3,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              child: FutureBuilder<List<MenuModel>?>(
                future: ServiceConfig.detailItem(),
                builder: (context, snapshot) {
                  final datadetail = snapshot.data;
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(
                          child: Expanded(child: CircularProgressIndicator()));
                    default:
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text(
                                'Maaf data sedang error, coba di Refresh'));
                      } else {
                        return buildMenu(datadetail!);
                      }
                  }
                },
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  Widget buildMenu(List<MenuModel> datadetail) => Container(
        margin: const EdgeInsets.only(bottom: 25, top: 25, left: 15, right: 15),
        width: 350,
        height: 500,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0.5, 2),
                color: Colors.black26,
                blurRadius: 4,
                blurStyle: BlurStyle.solid),
            BoxShadow(
                offset: Offset(0.5, 4),
                color: Colors.black12,
                blurRadius: 4,
                blurStyle: BlurStyle.solid)
          ],
        ),
        child: Column(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: Image.network(
              menumebel.detailImg,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    menumebel.nama,
                    style: const TextStyle(
                        letterSpacing: 1.3,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    menumebel.harga,
                    style: const TextStyle(
                        letterSpacing: 1.3,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    menumebel.deskripsi,
                    style: const TextStyle(
                        letterSpacing: 1.3,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
              ]),
            ),
          ),
        ]),
      );
}
