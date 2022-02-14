part of 'models.dart';

class ArcherModel extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? category;
  final String? image;
  final int? price;
  final double? rate;
  final int? stock;

  ArcherModel(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.image,
      this.price,
      this.rate = 4.5,
      this.stock});

  factory ArcherModel.fromJson(Map<String, dynamic> data) => ArcherModel(
        id: data['id'],
        // category: (data['kategori'] == "Alat Panahan")
        //     ? ArcherCategory.paketLatihan
        //     : ArcherCategory.busur,
        category: data['kategori'],
        name: data['nama'],
        price: data['harga'],
        description: data['deskripsi'],
        image: data['image'],
        stock: data['stok'],
      );

  ArcherModel copyWith({
    int? id,
    String? name,
    String? description,
    String? category,
    String? image,
    int? price,
    double? rate,
    int? stock,
  }) =>
      ArcherModel(
          id: id ?? this.id,
          name: name ?? this.name,
          description: description ?? this.description,
          category: category ?? this.category,
          image: image ?? this.image,
          price: price ?? this.price,
          rate: rate ?? this.rate,
          stock: stock ?? this.stock);

  @override
  List<Object?> get props =>
      [id, name, description, category, image, price, rate, stock];
}

List<ArcherModel> mockArchers = [
  ArcherModel(
      id: 1,
      name: "Pay and Play",
      description:
          "description description description description descriptiondescription description description description description description description description description description description description ",
      // category: ArcherCategory.paketLatihan,
      category: "Busur",
      image: "archer_1.png",
      price: 40000000,
      rate: 3,
      stock: 10),
  // ArcherModel(2, "Pay and Play", "description", "category", "archer_1.png",
  //     40000000, 3.5),
  // ArcherModel(3, "Pay and Play", "description", "category", "archer_1.png", 40000000, 4.5),
  // ArcherModel(4, "Pay and Play", "description", "category", "archer_1.png", 40000000, 4.5),
  // ArcherModel(5, "Pay and Play", "description", "category", "archer_1.png", 40000000, 4.5),
  // ArcherModel(6, "Pay and Play", "description", "category", "archer_1.png", 40000000, 4.5),
  // ArcherModel(7, "Pay and Play", "description", "category", "archer_1.png", 40000000, 4.5),
  // ArcherModel(8, "Pay and Plays", "description", "category", "archer_1.png",
  //     40000000, 2.5),
  // ArcherModel(9, "Pay and Playss", "description", "category", "archer_1.png",
  //     40000000, 1.5),
  // ArcherModel(10, "Pay and Playssssss", "description", "category",
  //     "archer_1.png", 40000000, 3),
  // ArcherModel(11, "Pay and Playsss", "description", "category", "archer_1.png",
  //     40000000, 2),
];
