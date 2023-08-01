import 'package:flutter/material.dart';
import 'package:prak3/pages/details.dart';
import 'package:prak3/service/serviceApi.dart';
import 'package:prak3/models/modelLocal.dart';

class GridMenuItem extends StatelessWidget {
  const GridMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MenuModel>>(
      future: ServiceConfig.ambilApi(context),
      builder: (context, snapshot) {
        final datamenu = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return const Center(
                  child: Text('Maaf data sedang error, coba di Refresh'));
            } else {
              return buildMenu(datamenu!);
            }
        }
      },
    );
  }

  Widget buildMenu(List<MenuModel> datamenu) => GridView.builder(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          mainAxisExtent: 180,
        ),
        itemCount: datamenu.length,
        itemBuilder: (context, index) {
          final menumebel = datamenu[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      DetailItem(menumebel: menumebel))),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      menumebel.image,
                      fit: BoxFit.fill,
                      height: 150,
                      width: double.infinity,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.90),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        menumebel.nama,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
}
