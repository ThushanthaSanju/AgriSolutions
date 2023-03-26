import 'package:agrifront/screens/vegitables.dart';
import 'package:agrifront/screens/vehicle.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../componets/custom_page_route.dart';
import '../componets/usernavigationdrawer.dart';
import 'fruits.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final List<String> imageList = [
    "https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-2foodgroups_vegetables_detailfeature.jpg?sfvrsn=226f1bc7_6",
    "https://domf5oio6qrcr.cloudfront.net/medialibrary/11499/3b360279-8b43-40f3-9b11-604749128187.jpg",
    "https://health.clevelandclinic.org/wp-content/uploads/sites/3/2020/08/best-fruits-1197259281-770x533-1-745x490.jpg",
    "https://www.snexplores.org/wp-content/uploads/2022/10/1440_SS_fruit_feat-1030x580.jpg",
    "https://lemonbin.com/wp-content/uploads/2022/03/4wd-john-deere-tractor.webp",
    "https://lemonbin.com/wp-content/uploads/2022/02/combine-harvester.webp",
  ];
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
              preferredSize: const Size.fromHeight(50),
              child: AppBar(
                centerTitle: true,
                backgroundColor: Color.fromARGB(255, 5, 156, 10),
                title: const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Home",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(215, 255, 255, 255)),
                  ),
                ),
                iconTheme: const IconThemeData(
                    color: Color.fromARGB(255, 247, 213, 255)),
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(16, 101, 235, 44),
                // image: DecorationImage(
                //     image: AssetImage('assets/images/background2.jpg'),
                //     fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 80.0),
                        child: Row(
                          children: [
                            Material(
                              color: Color.fromARGB(255, 255, 255, 255),
                              elevation: 8,
                              borderRadius: BorderRadius.circular(30),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                splashColor: Colors.black45,
                                onTap: () => Navigator.of(context).push(
                                    CustomPageRoute(
                                        child: FruitsService(),
                                        direction: AxisDirection.right)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        width: 3),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Ink.image(
                                        image: const AssetImage(
                                            'assets/images/fruit.png'),
                                        height: 90,
                                        width: 110,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 7),
                                      const Text(
                                        'Fruits',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Color.fromARGB(255, 25, 78, 3)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Material(
                                color: Color.fromARGB(255, 255, 255, 255),
                                elevation: 8,
                                borderRadius: BorderRadius.circular(30),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  splashColor: Colors.black45,
                                  onTap: () => Navigator.of(context).push(
                                      CustomPageRoute(
                                          child: VegitableService(),
                                          direction: AxisDirection.right)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          width: 3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Ink.image(
                                          image: const AssetImage(
                                              'assets/images/vegitable.png'),
                                          height: 90,
                                          width: 110,
                                          fit: BoxFit.fill,
                                        ),
                                        const SizedBox(height: 7),
                                        const Text(
                                          'Vegitables',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 25, 78, 3)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Material(
                                color: Color.fromARGB(255, 255, 255, 255),
                                elevation: 8,
                                borderRadius: BorderRadius.circular(30),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  splashColor: Colors.black45,
                                  onTap: () => Navigator.of(context).push(
                                      CustomPageRoute(
                                          child: VehiclsService(),
                                          direction: AxisDirection.right)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          width: 3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Ink.image(
                                          image: const AssetImage(
                                              'assets/images/vehicle.png'),
                                          height: 90,
                                          width: 110,
                                          fit: BoxFit.fill,
                                        ),
                                        const SizedBox(height: 7),
                                        const Text(
                                          'Vehicles',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 25, 78, 3)),
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
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          autoPlay: true,
                        ),
                        items: imageList
                            .map((e) => ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: <Widget>[
                                      Image.network(
                                        e,
                                        width: 1050,
                                        height: 350,
                                        fit: BoxFit.cover,
                                      )
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
