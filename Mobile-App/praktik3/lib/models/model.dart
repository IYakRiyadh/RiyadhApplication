class TiketModel {
  late int? id;
  late String _nama;
  late String _harga;
  late String _dari;
  late String _tujuan;
  late int _jumlahTiket;
  late String _waktu;

  TiketModel(this._nama, this._harga, this._dari, this._tujuan,
      this._jumlahTiket, this._waktu);

  TiketModel.withId(
    this.id,
    this._nama,
    this._harga,
    this._dari,
    this._tujuan,
    this._jumlahTiket,
    this._waktu,
  );

  String get nama => _nama;
  String get dari => _dari;
  String get harga => _harga;
  String get tujuan => _tujuan;
  int get jumlahTiket => _jumlahTiket;
  String get waktu => _waktu;

  set _id(int id) {
    _id = id;
  }

  set nama(String newNama) {
    if (newNama.length <= 255) {
      this._nama = newNama;
    }
  }

  set harga(String newHarga) {
    if (newHarga.length <= 255) {
      this._harga = newHarga;
    }
  }

  set dari(String newdari) {
    if (newdari.length <= 255) {
      this._dari = newdari;
    }
  }

  set tujuan(String newTujan) {
    if (newTujan.length <= 255) {
      this._tujuan = newTujan;
    }
  }

  set juamlah(int newJumlah) {
    if (newJumlah == 0) {
      this._jumlahTiket = newJumlah++;
    }
  }

  set waktu(String newWaktu) {
    this._waktu = newWaktu;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['nama'] = _nama;
    map['harga'] = _harga;
    map['dari'] = _dari;
    map['tujan'] = _tujuan;
    map['jumlahTiket'] = _jumlahTiket;
    map['waktu'] = _waktu;

    return map;
  }

  TiketModel.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _nama = map['nama'];
    _harga = map['harga'];
    _dari = map['dari'];
    _tujuan = map['tujuan'];
    _jumlahTiket = map['jumlahTiket'];
    _waktu = map['waktu'];
  }

  // map(dynamic obj) {}

}
