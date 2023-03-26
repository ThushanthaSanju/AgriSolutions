class VehicleModel {
  late String? id;
  late String? vehiclename;
  late String? drivername;
  late String? contactno;
  late String? priceperh;
  late String? category;

  VehicleModel();
  VehicleModel.create(this.id, this.vehiclename, this.drivername,
      this.contactno, this.priceperh, this.category);

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel.create(
        json['_id'],
        json['vehiclename'],
        json['drivername'],
        json['contactno'],
        json['priceperh'],
        json['category']);
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'vehiclename': vehiclename,
        'drivername': drivername,
        'contactno': contactno,
        'priceperh': priceperh,
        'category': category,
      };

  @override
  toString() {
    return vehiclename.toString();
  }
}
