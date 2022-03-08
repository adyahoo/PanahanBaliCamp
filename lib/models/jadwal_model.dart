part of 'models.dart';

class JadwalModel extends Equatable {
  final int? id;
  final String? name;
  final String? date;
  final String? startTime;
  final String? endTime;
  final String? status;
  final String? image;
  final String? description;
  final String? venue;

  JadwalModel({
    this.id,
    this.name,
    this.date,
    this.status,
    this.startTime,
    this.endTime,
    this.image,
    this.description,
    this.venue,
  });

  factory JadwalModel.fromJson(Map<String, dynamic> data) => JadwalModel(
        id: data['id'],
        name: data['nama_kegiatan'],
        date: Jiffy(data['hari']).format('d MMMM yyyy'),
        startTime: data['jam_mulai'],
        endTime: data['jam_selesai'],
        status: data['status'],
        image: data['foto_kegiatan'],
        description: data['deskripsi_kegiatan'],
        venue: data['venue'],
      );

  @override
  List<Object?> get props =>
      [id, name, date, startTime, endTime, status, image, description, venue];
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
