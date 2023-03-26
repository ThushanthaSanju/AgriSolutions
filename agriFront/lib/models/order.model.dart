class OrderModel {
  late String? id;
  late String? title;
  late String? orderNo;
  late String? itemcode;
  late String? contactno;
  late String? price;
  late String? quantity;
  late String? address;
  late String? method;
  late String? dcharge;

  OrderModel();
  OrderModel.create(
      this.id,
      this.title,
      this.orderNo,
      this.itemcode,
      this.contactno,
      this.price,
      this.quantity,
      this.address,
      this.method,
      this.dcharge);

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel.create(
        json['_id'],
        json['title'],
        json['orderNo'],
        json['itemcode'],
        json['contactno'],
        json['price'],
        json['quantity'],
        json['address'],
        json['method'],
        json['dcharge']);
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'orderNo': orderNo,
        'itemcode': itemcode,
        'contactno': contactno,
        'price': price,
        'quantity': quantity,
        'address': address,
        'method': method,
        'dcharge': dcharge,
      };

  @override
  toString() {
    return title.toString();
  }
}
