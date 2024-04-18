class ProductModel {
  final num? id;
  final String? name;
  final num? price;
  final num? oldPrice;
  final num? discount;
  final String? image;
  final String? desc;
  final List<String>? images;

  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
      required this.desc,
      required this.images
      });
  factory ProductModel.fromJson(json) {
    return ProductModel(
        id: json['id'],
        name: json['name'],
        price: json['price'] ,
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        desc: json['description'],
        images: json['images'].cast<String>(),
       );
  }
}
