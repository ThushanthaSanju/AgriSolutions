import 'package:agrifront/screens/admin/orderAdmin/orderlist.dart';
import 'package:agrifront/screens/admin/productsAdmin/productList.dart';
import 'package:agrifront/screens/admin/userAdmin/user.dart';
import 'package:agrifront/screens/admin/vehicleAdmin/vehicleList.dart';
import 'package:flutter/material.dart';

import '../../componets/navigationdrawer.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 207, 54, 54),
        ),
        child: Stack(children: [
          Scaffold(
            drawer: NevigationDrawer(),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: AppBar(
                centerTitle: true,
                backgroundColor: Color.fromARGB(255, 5, 156, 10),
                title: const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Admin Home",
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
                color: Color.fromARGB(255, 228, 254, 122),
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Row(
                          children: [
                            Material(
                              color: Color.fromARGB(255, 1, 148, 45),
                              elevation: 8,
                              borderRadius: BorderRadius.circular(30),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                splashColor: Colors.black45,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProdcutsView()),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Color.fromARGB(255, 1, 148, 45),
                                        width: 3),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Ink.image(
                                        image: AssetImage(
                                            'assets/images/ffdes.jpg'),
                                        height: 130,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 7),
                                      const Text(
                                        'Products',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Material(
                                color: const Color.fromARGB(255, 1, 148, 45),
                                elevation: 8,
                                borderRadius: BorderRadius.circular(30),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  splashColor: Colors.black45,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VehicleView()),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 1, 148, 45),
                                          width: 3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Ink.image(
                                          image: AssetImage(
                                              'assets/images/agvehi.jpg'),
                                          height: 130,
                                          width: 150,
                                          fit: BoxFit.fill,
                                        ),
                                        const SizedBox(height: 7),
                                        const Text(
                                          'Vehicles',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, left: 35.0),
                        child: Row(
                          children: [
                            Material(
                              color: const Color.fromARGB(255, 1, 148, 45),
                              elevation: 8,
                              borderRadius: BorderRadius.circular(30),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                splashColor: Colors.black45,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyOrders()),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 1, 148, 45),
                                        width: 3),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Ink.image(
                                        image: AssetImage(
                                            'assets/images/ordersss.png'),
                                        height: 130,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 7),
                                      const Text(
                                        'Orders',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Material(
                                color: const Color.fromARGB(255, 1, 148, 45),
                                elevation: 8,
                                borderRadius: BorderRadius.circular(30),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  splashColor: Colors.black45,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UserView()),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 1, 148, 45),
                                          width: 3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Ink.image(
                                          image: AssetImage(
                                              'assets/images/userss.jpg'),
                                          height: 130,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(height: 7),
                                        const Text(
                                          'Users',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
