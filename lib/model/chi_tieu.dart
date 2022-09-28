class ChiTieu {
  ChiTieu({
    required this.chiTieu,
  });

  List<ChiTieuElement> chiTieu;
}

class ChiTieuElement {
  ChiTieuElement({
    required this.data,
    required this.id,
  });

  Data data;
  int id;
}

class Data {
  Data({
    required this.iduser,
    required this.chiphi,
    required this.loai,
    required this.idthang,
  });

  int iduser;
  int chiphi;
  int loai;
  int idthang;
}
