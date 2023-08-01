import 'dart:io';

import 'package:http/io_client.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prak3/models/model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class TiketDb {
  static late TiketDb _tiketDb;
  // = TiketDb.internal();
  // TiketDb.internal();
  static late Database _database;

  String tiketTabel = 'tiketTabel';
  String colId = 'id';
  String colNama = 'nama';
  String colHarga = 'harga';
  String colDari = 'dari';
  String colTujuan = 'tujan';
  String colJumlah = 'jumlah';
  String colWaktu = 'waktu';

  TiketDb.buatBasisdata();

  factory TiketDb() {
    if (_tiketDb == null) {
      _tiketDb = TiketDb.buatBasisdata();
    }
    return _tiketDb;
  }

  // mengambil basisdata
  Future<Database> get database async {
    if (_database == null) {
      _database = await setDB();
    }
    return _database;
  }

// inisialisasi database
  Future<Database> setDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'tiket.db';
    // buka/buat database saat pada path
    var dbTiket = await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
    return dbTiket;
  }

  void _createDB(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tiketTabel ($colId INTEGER PRIMARY KEY, $colNama TEXT, $colHarga TEXT, $colDari TEXT, $colTujuan TEXT, $colJumlah INTEGER, $colWaktu TEXT)');
  }

  Future<List<Map<String, dynamic>>> getTiketMappingList() async {
    Database _db = await this.database;
    // var result =
    //     await _db.rawQuery('SELECT * FROM $tiketTabel ORDER BY $colJumlah ASC');
    var result = await _db.query(tiketTabel, orderBy: '$colJumlah ASC');
    return result;
  }

  // tambahdata
  Future<int> addTiket(TiketModel tiketModel) async {
    Database dbClient = await this.database;
    var hasil = await dbClient.insert(tiketTabel, tiketModel.toMap());
    return hasil;
  }

  // Updetedata
  Future<int> editTiket(TiketModel tiketModel) async {
    Database dbClient = await this.database;
    var hasil = await dbClient.update(tiketTabel, tiketModel.toMap(),
        where: '$colId = ?', whereArgs: [tiketModel.id]);
    return hasil;
  }

  // Hapusdata
  Future<int> hapusTiket(int id) async {
    var dbClient = await this.database;
    int hasil =
        await dbClient.rawDelete('DELETE FROM $tiketTabel WHERE $colId = $id');
    return hasil;
  }

  // read_data
  Future<int?> lihatTiketTable() async {
    var dbClient = await this.database;
    List<Map<String, dynamic>> x =
        (await dbClient.rawDelete('SELECT COUNT (*) from $tiketTabel'))
            as List<Map<String, dynamic>>;
    int? hasil = Sqflite.firstIntValue(x);
    return hasil;
  }

  // mengambil maping list dan convert ke list tiket objek
  Future<List<TiketModel>?> ambilListTiket() async {
    var listMapTiket = await getTiketMappingList();
    int itung = listMapTiket.length;

    List<TiketModel> listTiket = <TiketModel>[];

    for (int i = 0; i < itung; i++) {
      listTiket.add(TiketModel.fromMapObject(listMapTiket[i]));
    }
    return listTiket;
  }
}
