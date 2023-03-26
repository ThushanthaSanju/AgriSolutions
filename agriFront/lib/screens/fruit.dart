import 'package:agrifront/componets/usernavigationdrawer.dart';
import 'package:agrifront/screens/order.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import 'componets/custom_page_route.dart';
import 'models/product.model.dart';
import 'services/api_service.dart';

class FruitsService extends StatefulWidget {
  FruitsService({Key? key}) : super(key: key);

  final FruitsByService fruitsService = FruitsByService();

  @override
  _FruitsPageState createState() => _FruitsPageState();
}

class _FruitsPageState extends State<FruitsService> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  void _getProducts() {
    widget.fruitsService.getAll().then((value) => {
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
                "Fruits",
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () =>
                                    Navigator.of(context).push(CustomPageRoute(
                                        child: OrderCreatePage(
                                          title: data.title.toString(),
                                          price: data.price.toString(),
                                          itemcode: data.itemcode.toString(),
                                        ),
                                        direction: AxisDirection.right)),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        '${data.imageUrl}',
                                        height: 100,
                                        width: 100,
                                      ),
                                      // Column(
                                      //   children: [
                                      //     Text(data.title.toString()),
                                      //     Text(data.price.toString())
                                      //   ],
                                      // ),
                                      // leading: CircleAvatar(
                                      //     backgroundColor: Colors.white,
                                      //     backgroundImage:
                                      //         NetworkImage('${data.imageUrl}')),
                                      // title: Text(data.title.toString()),
                                      // subtitle: Text(data.price.toString()),
                                    ),
                                    Text(data.title.toString()),
                                    Text("Price: " + data.price.toString()),
                                    Text("Order Now",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Color.fromARGB(
                                                255, 239, 89, 2)))
                                  ],
                                ),
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
