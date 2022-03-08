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
  final String? listItems;

  ArcherModel({
    this.id,
    this.name,
    this.description,
    this.category,
    this.image,
    this.price,
    this.rate = 0,
    this.stock,
    this.listItems = "",
  });

  factory ArcherModel.fromJson(Map<String, dynamic> data) => ArcherModel(
      id: data['id'],
      category: data['kategori'],
      name: data['nama'],
      price: data['harga'],
      description: data['deskripsi'],
      image: data['image'],
      stock: data['stok'],
      rate: roundDouble(data['rating'].toDouble(), 1));

  factory ArcherModel.packageJson(Map<String, dynamic> data) => ArcherModel(
      id: data['id'],
      category: data['kategori'],
      name: data['nama'],
      price: 100,
      description: data['deskripsi'],
      image: data['image'],
      stock: data['stok'],
      rate: roundDouble(data['rating'].toDouble(), 1),
      listItems: data['isi_paket']);

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
      [id, name, description, category, image, price, rate, stock, listItems];
}

double roundDouble(double value, int places) {
  double mod = pow(10.0, places) as double;
  return ((value * mod).round().toDouble() / mod);
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
];
