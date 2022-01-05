part of 'models.dart';

class PertandinganModel {
  final String name;
  final String description;
  final String schedule;
  final String image;

  PertandinganModel(this.name, this.description, this.schedule, this.image);
}

List<PertandinganModel> mockPertandingan = [
  PertandinganModel("Perlombaan Sanur", "Perlombaan sanur yang terbaik", "Lapangan Sanur | 17 okt 2021 - 21 okt 2021", "training.png"),
];