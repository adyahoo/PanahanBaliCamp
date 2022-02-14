part of 'models.dart';

class VenueModel extends Equatable {
  final int? id;
  final String? name;
  final String? address;
  final String? image;
  final int? totalActivity;

  VenueModel(
      {this.id, this.name, this.address, this.image, this.totalActivity});

  factory VenueModel.fromJson(Map<String, dynamic> data) => VenueModel(
    id: data['id'],
    name: data['nama'],
    address: data['alamat'],
    image: "venue.jpg",
    totalActivity: data['jumlah_kegiatan'],
  );

  @override
  List<Object?> get props => [id, name, address, image, totalActivity];
}

List<VenueModel> mockVenue = [
  VenueModel(
      name: "Lapangan Sanur",
      address: "Jl. Sanur SanurS anur Sanur Sanur Sanur Sanur Sanur Sanur",
      image: "training.png",
      totalActivity: 3),
  // VenueModel(
  //     "Lapangan Kuta",
  //     "Jl. Sanur SanurS anur Sanur Sanur Sanur Sanur Sanur Sanur",
  //     "training.png",
  //     3),
  // VenueModel(
  //     "Lapangan Mertasari",
  //     "Jl. Sanur SanurS anur Sanur Sanur Sanur Sanur Sanur Sanur",
  //     "training.png",
  //     3),
];
