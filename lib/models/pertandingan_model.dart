part of 'models.dart';

class PertandinganModel extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? address;
  final String? schedule;
  final String? startTime;
  final String? endTime;
  final String? status;
  final String? image;

  PertandinganModel(
      {this.id,
      this.name,
      this.description,
      this.schedule,
      this.image,
      this.address,
      this.startTime,
      this.endTime,
      this.status});

  factory PertandinganModel.fromJson(Map<String, dynamic> data) =>
      PertandinganModel(
        id: data['id'],
        name: data['nama_kegiatan'],
        description: "pertandingan sanur pertandingan sanur pertandingan sanur",
        schedule: Jiffy(data['hari']).format('d MMMM yyyy'),
        image: "pertandingan.jpg",
        address: data['alamat'],
        startTime: data['jam_mulai'],
        endTime: data['jam_selesai'],
        status: data['status'],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        schedule,
        address,
        startTime,
        endTime,
        image,
        status
      ];
}

List<PertandinganModel> mockPertandingan = [
  PertandinganModel(
      name: "Perlombaan Sanur",
      description: "Perlombaan sanur yang terbaik",
      schedule: "Lapangan Sanur | 17 okt 2021 - 21 okt 2021",
      image: "training.png"),
];
