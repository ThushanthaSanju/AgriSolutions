class BookingModel {
  late String? id;
  // late String? bNo;
  late String? vehiclename;
  late String? drivername;
  late String? contactno;
  late String? priceperh;
  late String? hours;
  late String? address;
  late String? total;

  BookingModel();
  BookingModel.create(this.id, this.vehiclename, this.drivername,
      this.contactno, this.priceperh, this.hours, this.address, this.total);

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel.create(
        json['_id'],
        json['vehiclename'],
        json['drivername'],
        json['contactno'],
        json['priceperh'],
        json['hours'],
        json['address'],
        json['total']);
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'vehiclename': vehiclename,
        'drivername': drivername,
        'contactno': contactno,
        'priceperh': priceperh,
        'hours': hours,
        'address': address,
        'total': total,
      };

  @override
  toString() {
    return vehiclename.toString();
  }
}
