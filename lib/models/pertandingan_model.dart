part of 'models.dart';

class PertandinganModel {
  final String name;
  final String description;
  final String address;

  PertandinganModel(this.name, this.description, this.address);
}

List<PertandinganModel> mockPertandingan = [
  PertandinganModel("Perlombaan Sanur", "Perlombaan sanur yang terbaik", "Jl. Sanur"),
  PertandinganModel("Perlombaan Sanur1", "Perlombaan sanur yang terbaik", "Jl. Sanur"),
  PertandinganModel("Perlombaan Sanur2", "Perlombaan sanur yang terbaik", "Jl. Sanur"),
  PertandinganModel("Perlombaan Sanur3", "Perlombaan sanur yang terbaik", "Jl. Sanur"),
];