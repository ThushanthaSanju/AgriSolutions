import 'package:agrifront/models/product.model.dart';
import 'package:agrifront/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductEditPage extends StatefulWidget {
  ProductEditPage({Key? key, required this.product}) : super(key: key);

  final ProductModel product;
  final ProductsService productService = ProductsService();

  @override
  _ProductEditPageState createState() => _ProductEditPageState();
}

class _ProductEditPageState extends State<ProductEditPage> {
  final _formKey = GlobalKey<FormState>();

  late ProductModel product;
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    // _getEmployees();
    setState(() {
      product = widget.product;
    });
  }

  // void _getEmployees() {
  //   widget.productService.getAll().then((value) => {
  //         setState(() {
  //           products = value;
  //         })
  //       });
  // }

  void _save() {
    widget.productService
        .updateProduct(product)
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
              "Update Product",
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
                        image: AssetImage('assets/images/fandv.png'),
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
                          labelText: 'Enter the title',
                        ),
                        initialValue: product.title,
                        onChanged: (text) {
                          product.title = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Title is required!';
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
                          labelText: 'Enter the image URL',
                        ),
                        initialValue: product.imageUrl,
                        onChanged: (text) {
                          product.imageUrl = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Image URL is required!';
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
                        initialValue: product.price,
                        onChanged: (text) {
                          product.price = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Price is required!';
                          }
                          return null;
                        }),
                    const SizedBox(height: 15),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 35,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.production_quantity_limits),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Quantity',
                        ),
                        initialValue: product.quantity,
                        onChanged: (text) {
                          product.price = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Quantity is required!';
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
