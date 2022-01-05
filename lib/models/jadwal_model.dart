part of 'models.dart';

class JadwalModel {
  final String name;
  final String date;
  final String status;

  JadwalModel(this.name, this.date, this.status);
}

List<JadwalModel> mockJadwal = [
  JadwalModel("Latihan Pagi", "12 Nov 2021", "Recorded"),
  JadwalModel("Latihan Pagi", "12 Nov 2021", "Attendance"),
];