part of 'models.dart';

class ArcherModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final String category;
  final String image;
  final int price;
  final double rate;

  ArcherModel(this.id, this.name, this.description, this.category, this.image,
      this.price, this.rate);

  @override
  List<Object?> get props =>
      [id, name, description, category, image, price, rate];
}

List<ArcherModel> mockArchers = [
  ArcherModel(
      1,
      "Pay and Play",
      "description description description description descriptiondescription description description description description description description description description description description description ",
      "category",
      "archer_1.png",
      40000000,
      3),
  ArcherModel(2, "Pay and Play", "description", "category", "archer_1.png",
      40000000, 3.5),
  // ArcherModel(3, "Pay and Play", "description", "category", "archer_1.png", 40000000, 4.5),
  // ArcherModel(4, "Pay and Play", "description", "category", "archer_1.png", 40000000, 4.5),
  // ArcherModel(5, "Pay and Play", "description", "category", "archer_1.png", 40000000, 4.5),
  // ArcherModel(6, "Pay and Play", "description", "category", "archer_1.png", 40000000, 4.5),
  // ArcherModel(7, "Pay and Play", "description", "category", "archer_1.png", 40000000, 4.5),
  ArcherModel(8, "Pay and Plays", "description", "category", "archer_1.png",
      40000000, 2.5),
  ArcherModel(9, "Pay and Playss", "description", "category", "archer_1.png",
      40000000, 1.5),
  ArcherModel(10, "Pay and Playssssss", "description", "category",
      "archer_1.png", 40000000, 3),
  ArcherModel(11, "Pay and Playsss", "description", "category", "archer_1.png",
      40000000, 2),
];
