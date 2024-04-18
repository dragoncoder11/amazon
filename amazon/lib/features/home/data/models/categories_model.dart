class CategoriesModel {
  final int? id;
  final String? image;
    final String? name;


  CategoriesModel({required this.id, required this.image,required this.name});
  factory CategoriesModel.fromJson(json) {
    return CategoriesModel(id: json['id'], image: json['image'],name:json['name'], );
  }
}
