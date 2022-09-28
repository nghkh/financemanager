class ChiTieuThang {
  ChiTieuThang({
    required this.data,
    required this.id,
  });

  Data data;
  int id;
}

class Data {
  Data({
    required this.thang,
    required this.chiphi,
  });

  int thang;
  String chiphi;
}
