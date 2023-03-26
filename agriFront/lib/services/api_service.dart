import 'dart:convert';
import 'package:agrifront/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../models/booking.model.dart';
import '../models/order.model.dart';
import '../models/product.model.dart';
import '../models/vehicle.model.dart';

class ProductsService {
  String apiURL = 'http://10.0.2.2:8060'; // VERIFY IP

  Future<List<ProductModel>> getAll() async {
    final response =
        await http.get(Uri.parse(apiURL + '/products/getAllProducts'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error in: ' + response.body);
    }
  }

  insertProducts(ProductModel product) async {
    final response = await http.post(
      Uri.parse(apiURL + '/products/insert'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }

  updateProduct(ProductModel product) async {
    final response = await http.put(
      Uri.parse(apiURL + '/products/' + (product.id).toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }

  deleteProduct(ProductModel product) async {
    final response = await http.delete(
        Uri.parse(apiURL + '/products/' + (product.id).toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }
}

class FruitsByService {
  String apiURL = 'http://10.0.2.2:8060'; // VERIFY IP

  Future<List<ProductModel>> getAll() async {
    final response = await http.get(Uri.parse(apiURL + '/products/getFruits'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error in: ' + response.body);
    }
  }
}

class VegitablesByService {
  String apiURL = 'http://10.0.2.2:8060'; // VERIFY IP

  Future<List<ProductModel>> getAll() async {
    final response = await http.get(Uri.parse(apiURL + '/products/getVegi'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error in: ' + response.body);
    }
  }
}

class ProductsByService {
  String apiURL = 'http://10.0.2.2:8060'; // VERIFY IP

  Future<List<ProductModel>> getAll() async {
    final response =
        await http.get(Uri.parse(apiURL + '/products/getAllProducts'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error in: ' + response.body);
    }
  }
}

class ProductInsert {
  String baseurl = "http://10.0.2.2:8060";
  var log = Logger();
  Future<dynamic> get(String url) async {
    url = formaster(url);
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    url = formaster(url);
    var response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return response;
    }
  }

  String formaster(String url) {
    return baseurl + url;
  }
}

// //Social Issues

class VehiclesService {
  String apiURL = 'http://10.0.2.2:8060'; // VERIFY IP

  Future<List<VehicleModel>> getAll() async {
    final response =
        await http.get(Uri.parse(apiURL + '/vehicles/getAllVehicles'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<VehicleModel>((json) => VehicleModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error in: ' + response.body);
    }
  }

  insertVehicles(VehicleModel vehicle) async {
    final response = await http.post(
      Uri.parse(apiURL + '/vehicles/insert'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(vehicle.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }

  updateVehicle(VehicleModel vehicle) async {
    final response = await http.put(
      Uri.parse(apiURL + '/vehicles/' + (vehicle.id).toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(vehicle.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }

  deleteVehicle(VehicleModel vehicle) async {
    final response = await http.delete(
        Uri.parse(apiURL + '/vehicles/' + (vehicle.id).toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }
}

class VehiclsByService {
  String apiURL = 'http://10.0.2.2:8060'; // VERIFY IP

  Future<List<VehicleModel>> getAll() async {
    final response =
        await http.get(Uri.parse(apiURL + '/vehicles/getAllVehicles'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<VehicleModel>((json) => VehicleModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error in: ' + response.body);
    }
  }
}

class VehicleInsert {
  String baseurl = "http://10.0.2.2:8060";
  var log = Logger();
  Future<dynamic> get(String url) async {
    url = formaster(url);
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    url = formaster(url);
    var response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return response;
    }
  }

  String formaster(String url) {
    return baseurl + url;
  }
}

class RentInsert {
  String baseurl = "http://10.0.2.2:8060";
  var log = Logger();
  Future<dynamic> get(String url) async {
    url = formaster(url);
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    url = formaster(url);
    var response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return response;
    }
  }

  String formaster(String url) {
    return baseurl + url;
  }
}

class BookingService {
  String apiURL = 'http://10.0.2.2:8060';

  Future<List<BookingModel>> getAll() async {
    final response =
        await http.get(Uri.parse(apiURL + '/bookings/getAllBookings'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<BookingModel>((json) => BookingModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error in: ' + response.body);
    }
  }

  insertBooking(BookingModel adminIssue) async {
    final response = await http.post(
      Uri.parse(apiURL + '/bookings/insert'),
      headers: <String, String>{
        'Content-Type': 'application.json; charset=UTF-8',
      },
      body: jsonEncode(adminIssue.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }

  updateBooking(BookingModel adminIssue) async {
    final response = await http.put(
      Uri.parse(apiURL + '/bookings/' + (adminIssue.id).toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(adminIssue.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }

  deleteBooking(BookingModel adminIssue) async {
    final response = await http.delete(
        Uri.parse(apiURL + '/bookings/' + (adminIssue.id).toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }
}

class BookingInsert {
  String baseurl = "http://10.0.2.2:8060";
  var log = Logger();
  Future<dynamic> get(String url) async {
    url = formaster(url);
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    url = formaster(url);
    var response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return response;
    }
  }

  String formaster(String url) {
    return baseurl + url;
  }
}

// //Health
class OrderInsert {
  String baseurl = "http://10.0.2.2:8060";
  var log = Logger();
  Future<dynamic> get(String url) async {
    url = formaster(url);
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    url = formaster(url);
    var response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return response;
    }
  }

  String formaster(String url) {
    return baseurl + url;
  }
}

class OrderService {
  String apiURL = 'http://10.0.2.2:8060'; // VERIFY IP

  Future<List<OrderModel>> getAll() async {
    final response = await http.get(Uri.parse(apiURL + '/orders/getAllOrders'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<OrderModel>((json) => OrderModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error in: ' + response.body);
    }
  }

  insertOrders(OrderModel healthIssue) async {
    final response = await http.post(
      Uri.parse(apiURL + '/orders/insert'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(healthIssue.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }

  updateOrder(OrderModel healthIssue) async {
    final response = await http.put(
      Uri.parse(apiURL + '/orders/' + (healthIssue.id).toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(healthIssue.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }

  deleteOrder(OrderModel healthIssue) async {
    final response = await http.delete(
        Uri.parse(apiURL + '/orders/' + (healthIssue.id).toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }
}

// class HealthIssuesByService {
//   String apiURL = 'http://10.0.2.2:8060'; // VERIFY IP

//   Future<List<OrderModel>> getAll() async {
//     final response =
//         await http.get(Uri.parse(apiURL + '/healthIssueDetails/getIssuesaby'));

//     if (response.statusCode == 200) {
//       final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
//       return parsed
//           .map<OrderModel>((json) => OrderModel.fromJson(json))
//           .toList();
//     } else {
//       throw Exception('Error in: ' + response.body);
//     }
//   }
// }

class UserService {
  String apiURL = 'http://10.0.2.2:8060'; // VERIFY IP

  Future<List<User>> getAll() async {
    final response = await http.get(Uri.parse(apiURL + '/user/user'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<User>((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error in: ' + response.body);
    }
  }

  deleteUser(User healthIssue) async {
    final response = await http.delete(
        Uri.parse(apiURL + '/user/' + (healthIssue.id).toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }
}
