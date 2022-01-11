part of 'models.dart';

class VenueModel {
  final String name;
  final String address;
  final String image;
  final int totalActivity;

  VenueModel(this.name, this.address, this.image, this.totalActivity);
}

List<VenueModel> mockVenue = [
  VenueModel("Lapangan Sanur", "Jl. Sanur SanurS anur Sanur Sanur Sanur Sanur Sanur Sanur", "training.png", 3),
  VenueModel("Lapangan Kuta", "Jl. Sanur SanurS anur Sanur Sanur Sanur Sanur Sanur Sanur", "training.png", 3),
  VenueModel("Lapangan Mertasari", "Jl. Sanur SanurS anur Sanur Sanur Sanur Sanur Sanur Sanur", "training.png", 3),
];