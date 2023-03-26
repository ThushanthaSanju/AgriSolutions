import 'dart:math';

import 'package:agrifront/componets/custom_page_route.dart';
import 'package:agrifront/screens/bookings.dart';
import 'package:agrifront/screens/myOrders.dart';
import 'package:agrifront/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/order.model.dart';

class OrderCreatePage extends StatefulWidget {
  final String title;
  final String price;
  final String itemcode;
  OrderCreatePage(
      {Key? key,
      required this.title,
      required this.price,
      required this.itemcode})
      : super(key: key);

  final OrderService orderService = OrderService();

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderCreatePage> {
  final _formKey = GlobalKey<FormState>();
  OrderInsert orderInsert = OrderInsert();
  int _selected = 0;
  String? errorText;
  bool validate = false;
  late OrderModel product;
  List<OrderModel> products = [];

  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _nameController = TextEditingController();
  final _contactnoController = TextEditingController();
  final _quantityController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _getEmployees();
    setState(() {
      // product = widget.product;
    });
  }

  @override
  void onChanged(int value) {
    setState(() {
      _selected = value;
    });
  }

  // void _save() {
  //   widget.orderService
  //       .updateIssue(products)
  //       .then((value) => {
  //             Fluttertoast.showToast(
  //                 msg: 'Update Successfully',
  //                 toastLength: Toast.LENGTH_LONG,
  //                 fontSize: 20,
  //                 backgroundColor: Colors.green),
  //             Navigator.pop(context, 'Saved')
  //           })
  //       .catchError((err) => {print(err)});
  // }

  void _cancel() {
    Fluttertoast.showToast(
        msg: 'Cancelled',
        toastLength: Toast.LENGTH_LONG,
        fontSize: 20,
        backgroundColor: Colors.green);
    Navigator.pop(context, 'Cancelled');
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomNumber = random.nextInt(100);
    // final routeData =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    // final vehiName = routeData['title'];
    // final driveName = routeData['drivername'];
    // final pirceper = routeData['price'];
    return Scaffold(
      // drawer: NevigationDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 5, 156, 10),
          title: const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              "Order Now",
              style: TextStyle(
                  fontSize: 24.0, color: Color.fromARGB(215, 255, 255, 255)),
            ),
          ),
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 247, 213, 255)),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(16, 101, 235, 44),
        ),
        height: 900,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(35),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 40.0, right: 40.0, bottom: 10.0),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          // controller: _vehiNameController,
                          initialValue: widget.title,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90.0)),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(0, 0, 0, 0.523),
                                )),
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(239, 0, 0, 0)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(90.0)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(198, 0, 0, 0)),
                            ),
                            labelText: 'Item Name',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: TextFormField(
                            // initialValue: widget.price,
                            controller: _nameController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(90.0)),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(5, 2, 0, 0.325),
                                    )),
                                enabled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(198, 0, 0, 0)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25.0))),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90.0)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(198, 0, 0, 0)),
                                ),
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                )),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       top: 8.0, bottom: 10.0),
                        //   child: DropdownButtonHideUnderline(
                        //     child: DropdownButtonFormField<String>(
                        //       decoration: const InputDecoration(
                        //         border: OutlineInputBorder(
                        //             borderRadius: BorderRadius.all(
                        //                 Radius.circular(90.0)),
                        //             borderSide: BorderSide(
                        //               color: Color.fromRGBO(
                        //                   199, 158, 126, 173),
                        //             )),
                        //         enabled: true,
                        //         enabledBorder: OutlineInputBorder(
                        //             borderSide: BorderSide(
                        //                 color: Color.fromARGB(
                        //                     199, 158, 126, 173)),
                        //             borderRadius: BorderRadius.all(
                        //                 Radius.circular(25.0))),
                        //         focusedBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.all(
                        //               Radius.circular(90.0)),
                        //           borderSide: BorderSide(
                        //               color: Color.fromARGB(
                        //                   199, 158, 126, 173)),
                        //         ),
                        //       ),
                        //       validator: (value) {
                        //         if (value!.isEmpty) {
                        //           return "Gender can't be empty";
                        //         }
                        //         return null;
                        //       },
                        //       value: _genderController,
                        //       icon: const Icon(Icons.arrow_downward),
                        //       iconSize: 20,
                        //       elevation: 10,
                        //       style: const TextStyle(
                        //           color: Colors.deepPurple),
                        //       onChanged: (String? newValue) {
                        //         setState(() {
                        //           _genderController = newValue!;
                        //         });
                        //       },
                        //       items: listOfStrings
                        //           .map<DropdownMenuItem<String>>(
                        //               (String value) {
                        //         return DropdownMenuItem<String>(
                        //           value: value,
                        //           child: Text(value),
                        //         );
                        //       }).toList(),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: TextFormField(
                            // keyboardType: const TextInputType.numberWithOptions(
                            //     decimal: true),
                            controller: _addressController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90.0)),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.325),
                                  )),
                              enabled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(198, 0, 0, 0)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90.0)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(198, 0, 0, 0)),
                              ),
                              labelText: 'Address',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 1, 0, 2),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: TextFormField(
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            controller: _contactnoController,
                            // initialValue: widget.drivername,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90.0)),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.325),
                                  )),
                              enabled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(198, 0, 0, 0)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90.0)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(198, 0, 0, 0)),
                              ),
                              labelText: 'Contact No',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 1, 0, 2),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: TextFormField(
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            controller: _quantityController,
                            // initialValue: widget.drivername,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90.0)),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.325),
                                  )),
                              enabled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(198, 0, 0, 0)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90.0)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(198, 0, 0, 0)),
                              ),
                              labelText: 'Quantity',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 1, 0, 2),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: TextFormField(
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            // controller: _addressController,
                            initialValue: widget.price,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90.0)),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.325),
                                  )),
                              enabled: false,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(198, 0, 0, 0)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90.0)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(198, 0, 0, 0)),
                              ),
                              labelText: 'Price',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 1, 0, 2),
                              ),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 35.0),
                        //   child: TextFormField(
                        //     keyboardType: const TextInputType.numberWithOptions(
                        //         decimal: true),
                        //     // controller: _addressController,
                        //     initialValue: widget.title,
                        //     decoration: const InputDecoration(
                        //       border: OutlineInputBorder(
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(90.0)),
                        //           borderSide: BorderSide(
                        //             color: Color.fromRGBO(0, 0, 0, 0.325),
                        //           )),
                        //       enabled: true,
                        //       enabledBorder: OutlineInputBorder(
                        //           borderSide: BorderSide(
                        //               color: Color.fromARGB(198, 0, 0, 0)),
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(25.0))),
                        //       focusedBorder: OutlineInputBorder(
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(90.0)),
                        //         borderSide: BorderSide(
                        //             color: Color.fromARGB(198, 0, 0, 0)),
                        //       ),
                        //       labelText: 'Item Name',
                        //       labelStyle: TextStyle(
                        //         color: Color.fromARGB(255, 1, 0, 2),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ]),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 40),
              child: FloatingActionButton.extended(
                onPressed: () {
                  if (_formKey.currentState!.validate() || validate) {
                    Map<String, String> data = {
                      "title": widget.title,
                      "price": widget.price,
                      "itemcode": widget.itemcode,
                      "contactno": _contactnoController.text,
                      "quantity": _quantityController.text,
                      "address": _addressController.text,
                      "orderNo": "O0" + randomNumber.toString(),
                    };
                    print(data);
                    var result = orderInsert.post("/orders/insert", data);
                    if (result == null) {
                      Fluttertoast.showToast(
                          msg: "Unsccessfully", // message
                          toastLength: Toast.LENGTH_LONG,
                          fontSize: 20,
                          backgroundColor: Colors.red // duration
                          );
                    } else {
                      Fluttertoast.showToast(
                          msg: "Save Successfully", // message
                          toastLength: Toast.LENGTH_LONG,
                          fontSize: 20,
                          backgroundColor: Colors.green // duration
                          );
                      Navigator.of(context).push(CustomPageRoute(
                          child: MyOrders(), direction: AxisDirection.left));
                    }
                  } else {
                    Fluttertoast.showToast(
                        msg: "Please Fill all Fields", // message
                        toastLength: Toast.LENGTH_LONG,
                        fontSize: 20,
                        backgroundColor: Colors.red // duration
                        );
                  }
                },
                label: const Text(
                  'Order Now',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Color.fromARGB(215, 255, 255, 255)),
                ),
                icon: const Icon(Icons.book_online, color: Colors.white),
                backgroundColor: Color.fromARGB(215, 150, 225, 143),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
