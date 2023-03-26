import 'package:agrifront/componets/custom_page_route.dart';
import 'package:agrifront/screens/bookings.dart';
import 'package:agrifront/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/booking.model.dart';

class RentCreatePage extends StatefulWidget {
  final String vehicleName;
  final String drivername;
  final String priceperh;
  RentCreatePage(
      {Key? key,
      required this.vehicleName,
      required this.drivername,
      required this.priceperh})
      : super(key: key);

  final BookingService bookingService = BookingService();

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<RentCreatePage> {
  final _formKey = GlobalKey<FormState>();
  BookingInsert bookingInsert = BookingInsert();
  int _selected = 0;
  String? errorText;
  bool validate = false;
  late BookingModel product;
  List<BookingModel> products = [];

  final _vehiNameController = TextEditingController();
  final _drivNameController = TextEditingController();
  final _priceperHController = TextEditingController();
  final _contactnoController = TextEditingController();
  final _hoursController = TextEditingController();
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
  //   widget.bookingService
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
    // final routeData =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    // final vehiName = routeData['vehicleName'];
    // final driveName = routeData['drivername'];
    // final pirceper = routeData['priceperh'];
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
              "Book Vehicles",
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
                          initialValue: widget.vehicleName,
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
                            labelText: 'Vehicle Name',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: TextFormField(
                            initialValue: widget.priceperh,
                            // controller: _priceperHController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(90.0)),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(5, 2, 0, 0.325),
                                    )),
                                enabled: false,
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
                                labelText: 'Price per Hour',
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
                            // controller: _drivNameController,
                            initialValue: widget.drivername,
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
                              labelText: 'Driver Name',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 1, 0, 2),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: TextFormField(
                            // keyboardType: const TextInputType.numberWithOptions(
                            //     decimal: true),
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
                            controller: _hoursController,
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
                              labelText: 'Hours',
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
                            controller: _addressController,
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
                              labelText: 'Address',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 1, 0, 2),
                              ),
                            ),
                          ),
                        ),
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
                      "vehiclename": widget.vehicleName,
                      "drivername": widget.drivername,
                      "priceperh": widget.priceperh,
                      "contactno": _contactnoController.text,
                      "hours": _hoursController.text,
                      "address": _addressController.text,
                      // "total":
                      //     (widget.priceperh) * int.parse(_hoursController.text),
                    };
                    print(data);
                    var result = bookingInsert.post("/bookings/insert", data);
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
                          child: Booking(), direction: AxisDirection.left));
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
                  'Book Now',
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
