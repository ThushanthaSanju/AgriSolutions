class ProductModel {
  late String? id;
  late String? title;
  late String? itemcode;
  late String? imageUrl;
  late String? price;
  late String? quantity;
  late String? category;

  ProductModel();
  ProductModel.create(this.id, this.title, this.itemcode, this.imageUrl,
      this.price, this.quantity, this.category);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel.create(json['_id'], json['title'], json['itemcode'],
        json['imageUrl'], json['price'], json['quantity'], json['category']);
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'itemcode': itemcode,
        'imageUrl': imageUrl,
        'price': price,
        'quantity': quantity,
        'category': category,
      };

  @override
  toString() {
    return title.toString();
  }
}
