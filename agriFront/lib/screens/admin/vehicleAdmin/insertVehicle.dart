import 'package:agrifront/componets/custom_page_route.dart';
import 'package:agrifront/screens/admin/productsAdmin/productList.dart';
import 'package:agrifront/screens/admin/vehicleAdmin/vehicleList.dart';
import 'package:agrifront/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class VehicleCreatePage extends StatefulWidget {
  VehicleCreatePage({Key? key}) : super(key: key);

  @override
  _VehicleCreatePageState createState() => _VehicleCreatePageState();
}

class _VehicleCreatePageState extends State<VehicleCreatePage> {
  final _formKey = GlobalKey<FormState>();
  VehicleInsert productInsert = VehicleInsert();
  int _selected = 0;
  String? errorText;
  bool validate = false;
  bool circular = false;

  final _vehiclenameController = TextEditingController();
  final _contactnoController = TextEditingController();
  final _drivernameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  void onChanged(int value) {
    setState(() {
      _selected = value;
    });
  }

  Future<void> refresh() async {
    _vehiclenameController.text = '';
    _contactnoController.text = '';
    _drivernameController.text = '';
    _priceController.text = '';
    _quantityController.text = '';
    errorText = null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          // drawer: NevigationDrawer(),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 5, 156, 10),
              title: const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Add Vehicle",
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Color.fromARGB(215, 255, 255, 255)),
                ),
              ),
              iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 247, 213, 255)),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(109, 207, 236, 103),
            ),
            child: Stack(
              children: [
                // Positioned(
                //     top: 480,
                //     left: 0,
                //     child: Container(
                //       width: 410,
                //       height: 210,
                //       decoration: const BoxDecoration(
                //         image: DecorationImage(
                //           colorFilter: ColorFilter.mode(Color.fromARGB(255, 0, 0, 0).withOpacity(0.2), BlendMode.dstATop),
                //             image: AssetImage('assets/images/fandv.png', ),
                //             fit: BoxFit.fill),
                //       ),
                //     )),
                LiquidPullToRefresh(
                  color: Color.fromARGB(255, 137, 231, 69),
                  onRefresh: refresh,
                  child: ListView(
                    children: [
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 40.0, right: 40.0, bottom: 10.0),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: _vehiclenameController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(90.0)),
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(0, 0, 0, 0.325),
                                        )),
                                    enabled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromARGB(198, 0, 0, 0)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0))),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(90.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(197, 0, 0, 0)),
                                    ),
                                    labelText: 'Enter Vehicle Type',
                                    labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Vehicle Type can't be empty";
                                    }
                                    if (value.length < 3)
                                      return 'Enter minimum 3';
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: TextFormField(
                                    controller: _drivernameController,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(90.0)),
                                            borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  199, 158, 126, 173),
                                            )),
                                        enabled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    198, 0, 0, 0)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25.0))),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(90.0)),
                                          borderSide: BorderSide(
                                              color:
                                                  Color.fromARGB(198, 0, 0, 0)),
                                        ),
                                        labelText: 'Enter Driver Name',
                                        labelStyle: TextStyle(
                                          color: Color.fromARGB(255, 10, 1, 13),
                                        )),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Driver Name can't be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 35.0),
                                  child: TextFormField(
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    controller: _contactnoController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(90.0)),
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                199, 158, 126, 173),
                                          )),
                                      enabled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  198, 15, 14, 15)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0))),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(90.0)),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                198, 14, 13, 14)),
                                      ),
                                      labelText: 'Enter Contact No',
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 13, 12, 13),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return "Contact No can't be empty";
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 35.0),
                                  child: TextFormField(
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    controller: _priceController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(90.0)),
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                199, 158, 126, 173),
                                          )),
                                      enabled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  198, 15, 14, 15)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0))),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(90.0)),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                198, 14, 13, 14)),
                                      ),
                                      labelText: 'Enter Price',
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 13, 12, 13),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return "Price can't be empty";
                                      return null;
                                    },
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Positioned(
                          top: 610,
                          left: 0,
                          child: Container(
                            width: 280,
                            height: 210,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/vehicle.png'),
                                  fit: BoxFit.fill),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
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
                  "vehiclename": _vehiclenameController.text,
                  "drivername": _drivernameController.text,
                  "contactno": _contactnoController.text,
                  "priceperh": _priceController.text,
                  "quantity": _quantityController.text,
                };
                print(data);
                var result = productInsert.post("/vehicles/insert", data);
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
                      child: VehicleView(), direction: AxisDirection.left));
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
              'Save',
              style: TextStyle(
                  fontSize: 24.0, color: Color.fromARGB(215, 255, 255, 255)),
            ),
            icon: const Icon(Icons.save, color: Colors.white),
            backgroundColor: Color.fromARGB(212, 50, 44, 231),
          ),
        ),
      ],
    );
  }
}
