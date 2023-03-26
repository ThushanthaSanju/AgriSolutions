import 'package:agrifront/models/vehicle.model.dart';
import 'package:agrifront/models/vehicle.model.dart';
import 'package:agrifront/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VehicleEditPage extends StatefulWidget {
  VehicleEditPage({Key? key, required this.vehicle}) : super(key: key);

  final VehicleModel vehicle;
  final VehiclesService vehiclesService = VehiclesService();

  @override
  _VehicleEditPageState createState() => _VehicleEditPageState();
}

class _VehicleEditPageState extends State<VehicleEditPage> {
  final _formKey = GlobalKey<FormState>();

  late VehicleModel vehicle;
  List<VehicleModel> vehicles = [];

  @override
  void initState() {
    super.initState();
    // _getEmployees();
    setState(() {
      vehicle = widget.vehicle;
    });
  }

  // void _getEmployees() {
  //   widget.vehiclesService.getAll().then((value) => {
  //         setState(() {
  //           vehicles = value;
  //         })
  //       });
  // }

  void _save() {
    widget.vehiclesService
        .updateVehicle(vehicle)
        .then((value) => {
              Fluttertoast.showToast(
                  msg: 'Update Successfully',
                  toastLength: Toast.LENGTH_LONG,
                  fontSize: 20,
                  backgroundColor: Colors.green),
              Navigator.pop(context, 'Saved')
            })
        .catchError((err) => {print(err)});
  }

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
              "Update Vehicle",
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
          color: Color.fromARGB(141, 235, 241, 150),
        ),
        height: 900,
        child: Stack(
          children: [
            Positioned(
                top: 500,
                left: 0,
                child: Container(
                  width: 410,
                  height: 210,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/vehicle.png'),
                        fit: BoxFit.fill),
                  ),
                )),
            SingleChildScrollView(
              padding: const EdgeInsets.all(35),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 250,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.title),
                          border: OutlineInputBorder(),
                          labelText: 'Enter the Driver Name',
                        ),
                        initialValue: vehicle.drivername,
                        onChanged: (text) {
                          vehicle.drivername = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Driver Name is required!';
                          }
                          return null;
                        }),
                    const SizedBox(height: 15),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 600,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.image),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Contact No',
                        ),
                        initialValue: vehicle.contactno,
                        onChanged: (text) {
                          vehicle.contactno = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Contact No is required!';
                          }
                          return null;
                        }),
                    const SizedBox(height: 15),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 35,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.price_change),
                          border: OutlineInputBorder(),
                          labelText: 'Enter price',
                        ),
                        initialValue: vehicle.priceperh,
                        onChanged: (text) {
                          vehicle.priceperh = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Price is required!';
                          }
                          return null;
                        }),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(
                            Icons.save,
                            color: Colors.black54,
                          ),
                          label: const Text('Update'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _save();
                            }
                          },
                        ),
                        const SizedBox(width: 50),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.cancel, color: Colors.black54),
                          label: const Text('Cancel'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            _cancel();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
