part of 'models.dart';

class VenueModel {
  final String name;
  final String address;

  VenueModel(this.name, this.address);
}

List<VenueModel> mockVenue = [
  VenueModel("Lapangan Sanur", "Jl. Sanur"),
  VenueModel("Lapangan Sanur1", "Jl. Sanur1"),
  VenueModel("Lapangan Sanur2", "Jl. Sanur2"),
  VenueModel("Lapangan Sanur3", "Jl. Sanur3"),
];