part of 'models.dart';

class JadwalModel extends Equatable {
  final int? id;
  final String? name;
  final String? date;
  final String? startTime;
  final String? endTime;
  final String? status;

  JadwalModel(
      {this.id,
      this.name,
      this.date,
      this.status,
      this.startTime,
      this.endTime});

  factory JadwalModel.fromJson(Map<String, dynamic> data) => JadwalModel(
        id: data['id'],
        name: data['nama_kegiatan'],
        date: Jiffy(data['hari']).format('d MMMM yyyy'),
        startTime: data['jam_mulai'],
        endTime: data['jam_selesai'],
        status: data['status'],
      );

  @override
  List<Object?> get props => [id, name, date, startTime, endTime, status];
}

List<JadwalModel> mockJadwal = [
  JadwalModel(
      name: "Latihan Pagi",
      date: "Latihan Pagi",
      startTime: "Latihan Pagi",
      endTime: "12 Nov 2021",
      status: "Recorded"),
  JadwalModel(
      name: "Latihan Pagi",
      date: "Latihan Pagi",
      startTime: "Latihan Pagi",
      endTime: "12 Nov 2021",
      status: "Attendance"),
];
