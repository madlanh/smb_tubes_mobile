import 'package:hive/hive.dart';

part '../../model/pendaftar.g.dart';

@HiveType(typeId: 0)
class Pendaftar {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String nama;

  @HiveField(2)
  final String asalKota;

  @HiveField(3)
  final List<String> jurusan;

  @HiveField(4)
  final int nilaiTes;

  Pendaftar({
    required this.id,
    required this.nama,
    required this.asalKota,
    required this.jurusan,
    required this.nilaiTes,
  });
}