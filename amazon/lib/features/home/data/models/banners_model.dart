class BannersModel {
  final int? id;
  final String? image;

  BannersModel({ required this.id,  required this.image});
  factory BannersModel.fromJson(json) {
    return BannersModel(id: json['id'],  image: json['image']);
  }
}
