import 'package:agrifront/componets/usernavigationdrawer.dart';
import 'package:agrifront/models/vehicle.model.dart';
import 'package:agrifront/screens/rentVehicle.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import '../componets/custom_page_route.dart';
import '../services/api_service.dart';

class VehiclsService extends StatefulWidget {
  VehiclsService({Key? key}) : super(key: key);

  final VehiclsByService vehiclsService = VehiclsByService();

  @override
  _VehiclesPageState createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclsService> {
  List<VehicleModel> products = [];
  late VehicleModel product;
  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  void _getProducts() {
    widget.vehiclsService.getAll().then((value) => {
          setState(() {
            products = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawer: NevigationDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 5, 156, 10),
            title: const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "Vehicles",
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(215, 255, 255, 255)),
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
          child: Stack(
            children: [
              Center(
                child: GridView(
                  padding: const EdgeInsets.only(
                      top: 25.0, left: 25.0, right: 25.0, bottom: 100.0),
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 20),
                  children: products
                      .map((data) => Card(
                            color: Color.fromARGB(86, 177, 242, 201),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            elevation: 3,
                            child: InkWell(
                              // onTap: () => Navigator.of(context).push(
                              //     CustomPageRoute(
                              //         child: SocialSolutionUser(),
                              //         direction: AxisDirection.right)),
                              child: Column(
                                children: [
                                  // Expanded(
                                  //   child: Text(data.vehiclename.toString()),
                                  //   // child: Image.network(
                                  //   //   '${data.imageUrl}',
                                  //   //   height: 100,
                                  //   //   width: 100,
                                  //   // ),
                                  //   // Column(
                                  //   //   children: [
                                  //   //     Text(data.title.toString()),
                                  //   //     Text(data.price.toString())
                                  //   //   ],
                                  //   // ),
                                  //   // leading: CircleAvatar(
                                  //   //     backgroundColor: Colors.white,
                                  //   //     backgroundImage:
                                  //   //         NetworkImage('${data.imageUrl}')),
                                  //   // title: Text(data.title.toString()),
                                  //   // subtitle: Text(data.price.toString()),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0,
                                        right: 8.0,
                                        bottom: 8.0,
                                        top: 20.0),
                                    child: Text(
                                      data.vehiclename.toString(),
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Driver: " +
                                        data.drivername.toString()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Price Per Hour: " +
                                          data.priceperh.toString(),
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ),
                                  InkWell(
                                      splashColor: Colors.black45,
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RentCreatePage(
                                                      vehicleName: data
                                                          .vehiclename
                                                          .toString(),
                                                      drivername: data
                                                          .drivername
                                                          .toString(),
                                                      priceperh: data.priceperh
                                                          .toString()))),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(184, 84, 92, 241),
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 84, 142, 223),
                                              width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          "Book Now",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
