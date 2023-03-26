import 'package:agrifront/componets/custom_page_route.dart';
import 'package:agrifront/screens/admin/productsAdmin/productList.dart';
import 'package:agrifront/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ProductCreatePage extends StatefulWidget {
  ProductCreatePage({Key? key}) : super(key: key);

  @override
  _ProductCreatePageState createState() => _ProductCreatePageState();
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  final _formKey = GlobalKey<FormState>();
  ProductInsert productInsert = ProductInsert();
  int _selected = 0;
  String? errorText;
  bool validate = false;
  bool circular = false;

  String _categoryController = "Fruits";

  List<String> listOfStrings = ["Fruits", "Vegitables"];

  final _titleController = TextEditingController();
  final _itemcodeController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  void onChanged(int value) {
    setState(() {
      _selected = value;
    });
  }

  Future<void> refresh() async {
    _titleController.text = '';
    _itemcodeController.text = '';
    _imageUrlController.text = '';
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
                  "Insert Product",
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
                                  controller: _titleController,
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
                                    labelText: 'Enter Title',
                                    labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Title can't be empty";
                                    }
                                    if (value.length < 3)
                                      return 'Enter minimum 3';
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: TextFormField(
                                    controller: _imageUrlController,
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
                                        labelText: 'Enter your image Url',
                                        labelStyle: TextStyle(
                                          color: Color.fromARGB(255, 10, 1, 13),
                                        )),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Image Url can't be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 15.0, bottom: 10.0),
                                  child: Text(
                                    'Category',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 12, 12, 12)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 10.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField<String>(
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
                                                  Color.fromARGB(198, 2, 2, 2)),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Category can't be empty";
                                        }
                                        return null;
                                      },
                                      value: _categoryController,
                                      icon: const Icon(Icons.arrow_downward),
                                      iconSize: 20,
                                      elevation: 10,
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 10, 10, 10)),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _categoryController = newValue!;
                                        });
                                      },
                                      items: listOfStrings
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 35.0),
                                  child: TextFormField(
                                    // keyboardType:
                                    //     const TextInputType.numberWithOptions(
                                    //         decimal: true),
                                    controller: _itemcodeController,
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
                                      labelText: 'Enter ItemCode',
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 13, 12, 13),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return "Age can't be empty";
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 35.0),
                                  child: TextFormField(
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    controller: _quantityController,
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
                                      labelText: 'Enter Quantity',
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 13, 12, 13),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return "Quantity can't be empty";
                                      return null;
                                    },
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      // Positioned(
                      //     top: 610,
                      //     left: 0,
                      //     child: Container(
                      //       width: 410,
                      //       height: 210,
                      //       decoration: const BoxDecoration(
                      //         image: DecorationImage(
                      //             image: AssetImage('assets/images/ero.png'),
                      //             fit: BoxFit.fill),
                      //       ),
                      //     )),
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
                  "title": _titleController.text,
                  "imageUrl": _imageUrlController.text,
                  "category": _categoryController,
                  "itemcode": _itemcodeController.text,
                  "price": _priceController.text,
                  "quantity": _quantityController.text,
                };
                print(data);
                var result = productInsert.post("/products/insert", data);
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
                      child: ProdcutsView(), direction: AxisDirection.left));
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
