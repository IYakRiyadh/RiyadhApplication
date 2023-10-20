import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class PesananPage extends StatefulWidget {
  const PesananPage({super.key});

  @override
  State<PesananPage> createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  // final ctrlMap = BaseMapController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Pesanan'),
        titleTextStyle: TextStyle(color: Colors.black87, fontSize: 20),
      ),
      body: Builder(builder: (context) {
        return OSMFlutter(
          controller: MapController.cyclOSMLayer(
            initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
            areaLimit: BoundingBox(
              east: 10.4922941,
              north: 47.8084648,
              south: 45.817995,
              west: 5.9559113,
            ),
          ),
          osmOption: OSMOption(),
        );
      }),
    );
  }
}
