import 'package:flutter/material.dart';
import 'package:prak3/main.dart';

class ProfilPage extends StatelessWidget {
  // final String nama, email;

  const ProfilPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (localStorage != null) ;
    final ukuran = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: ukuran.width,
            height: 380,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(35),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(
                                  right: 15, left: 15, top: 140),
                              child: Column(
                                children: <Widget>[
                                  // if (localStorage != null)
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${localData.get('nama')}',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${localData.get('email')}',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(120),
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      '/images/avatar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
