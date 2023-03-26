import 'package:agrifront/screens/updateBooking.dart';
import 'package:agrifront/services/api_service.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:marquee/marquee.dart';

import '../models/booking.model.dart';
import '../models/vehicle.model.dart';
import '../utils/confirmDialog.dart';

class Booking extends StatefulWidget {
  Booking({
    Key? key,
  }) : super(key: key);

  final BookingService bookingService = BookingService();

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<Booking> {
  List<BookingModel> bookings = [];

  @override
  void initState() {
    super.initState();
    _getBookings();
  }

  Future<void> _getBookings() async {
    widget.bookingService.getAll().then((value) => {
          setState(() {
            bookings = value;
          })
        });
  }

  void _editeBookings(BookingModel booking) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => BookingEditPage(booking: booking)),
    );
    _getBookings();
  }

  void deleteBooking(BookingModel booking) {
    ConfirmDialog.show(
      context,
      'Are you sure you want to delete?',
      () => ({
        widget.bookingService
            .deleteBooking(booking)
            .then((value) => {
                  Fluttertoast.showToast(
                      msg: 'Successfully Deleted',
                      toastLength: Toast.LENGTH_LONG,
                      fontSize: 20,
                      backgroundColor: Colors.green),
                  _getBookings()
                })
            .catchError((e) => {print(e.toString())})
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // drawer: NevigationDrawer(),
        // drawer: NevigationDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 5, 156, 10),
            title: const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "My Bookings",
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
            // image: DecorationImage(
            //     image: AssetImage('assets/images/issueback.jpg'),
            //     fit: BoxFit.cover),
          ),
          child: Center(
            child: LiquidPullToRefresh(
              color: Color.fromARGB(255, 69, 231, 93),
              onRefresh: _getBookings,
              child: ListView(
                padding: const EdgeInsets.all(25.0),
                scrollDirection: Axis.vertical,
                children: bookings
                    .map((data) => Card(
                          color: Color.fromARGB(255, 230, 238, 139),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          elevation: 3,
                          child: Expanded(
                            child: ListTile(
                              leading: Text(data.vehiclename.toString()),
                              title: Text("Hours: " + data.hours.toString()),
                              subtitle:
                                  Text("Address: " + data.address.toString()),
                              trailing: PopupMenuButton(
                                onSelected: (option) {
                                  if (option == 'edit') {
                                    _editeBookings(data);
                                  } else {
                                    deleteBooking(data);
                                  }
                                },
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 'edit',
                                    child: Row(children: const [
                                      Icon(Icons.edit),
                                      SizedBox(width: 10),
                                      Text('Edit'),
                                    ]),
                                  ),
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: Row(children: const [
                                      Icon(Icons.delete),
                                      SizedBox(width: 10),
                                      Text('Delete'),
                                    ]),
                                  ),
                                ],
                              ),
                              isThreeLine: true,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget animatedHeader(String text) => Container(
        height: 30,
        margin: const EdgeInsets.only(top: 5),
        child: Marquee(
          text: text,
          style: const TextStyle(
              fontSize: 24, color: Color.fromARGB(215, 255, 255, 255)),
          blankSpace: 80,
          velocity: 100,
          pauseAfterRound: const Duration(seconds: 1),
        ),
      );
}
import 'package:agrifront/screens/updateBooking.dart';
import 'package:agrifront/services/api_service.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:marquee/marquee.dart';

import '../models/booking.model.dart';
import '../models/vehicle.model.dart';
import '../utils/confirmDialog.dart';

class Booking extends StatefulWidget {
  Booking({
    Key? key,
  }) : super(key: key);

  final BookingService bookingService = BookingService();

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<Booking> {
  List<BookingModel> bookings = [];

  @override
  void initState() {
    super.initState();
    _getBookings();
  }

  Future<void> _getBookings() async {
    widget.bookingService.getAll().then((value) => {
          setState(() {
            bookings = value;
          })
        });
  }

  void _editeBookings(BookingModel booking) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => BookingEditPage(booking: booking)),
    );
    _getBookings();
  }

  void deleteBooking(BookingModel booking) {
    ConfirmDialog.show(
      context,
      'Are you sure you want to delete?',
      () => ({
        widget.bookingService
            .deleteBooking(booking)
            .then((value) => {
                  Fluttertoast.showToast(
                      msg: 'Successfully Deleted',
                      toastLength: Toast.LENGTH_LONG,
                      fontSize: 20,
                      backgroundColor: Colors.green),
                  _getBookings()
                })
            .catchError((e) => {print(e.toString())})
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // drawer: NevigationDrawer(),
        // drawer: NevigationDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 5, 156, 10),
            title: const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "My Bookings",
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
            // image: DecorationImage(
            //     image: AssetImage('assets/images/issueback.jpg'),
            //     fit: BoxFit.cover),
          ),
          child: Center(
            child: LiquidPullToRefresh(
              color: Color.fromARGB(255, 69, 231, 93),
              onRefresh: _getBookings,
              child: ListView(
                padding: const EdgeInsets.all(25.0),
                scrollDirection: Axis.vertical,
                children: bookings
                    .map((data) => Card(
                          color: Color.fromARGB(255, 230, 238, 139),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          elevation: 3,
                          child: Expanded(
                            child: ListTile(
                              leading: Text(data.vehiclename.toString()),
                              title: Text("Hours: " + data.hours.toString()),
                              subtitle:
                                  Text("Address: " + data.address.toString()),
                              trailing: PopupMenuButton(
                                onSelected: (option) {
                                  if (option == 'edit') {
                                    _editeBookings(data);
                                  } else {
                                    deleteBooking(data);
                                  }
                                },
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 'edit',
                                    child: Row(children: const [
                                      Icon(Icons.edit),
                                      SizedBox(width: 10),
                                      Text('Edit'),
                                    ]),
                                  ),
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: Row(children: const [
                                      Icon(Icons.delete),
                                      SizedBox(width: 10),
                                      Text('Delete'),
                                    ]),
                                  ),
                                ],
                              ),
                              isThreeLine: true,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget animatedHeader(String text) => Container(
        height: 30,
        margin: const EdgeInsets.only(top: 5),
        child: Marquee(
          text: text,
          style: const TextStyle(
              fontSize: 24, color: Color.fromARGB(215, 255, 255, 255)),
          blankSpace: 80,
          velocity: 100,
          pauseAfterRound: const Duration(seconds: 1),
        ),
      );
}
import 'package:agrifront/screens/updateBooking.dart';
import 'package:agrifront/services/api_service.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:marquee/marquee.dart';

import '../models/booking.model.dart';
import '../models/vehicle.model.dart';
import '../utils/confirmDialog.dart';

class Booking extends StatefulWidget {
  Booking({
    Key? key,
  }) : super(key: key);

  final BookingService bookingService = BookingService();

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<Booking> {
  List<BookingModel> bookings = [];

  @override
  void initState() {
    super.initState();
    _getBookings();
  }

  Future<void> _getBookings() async {
    widget.bookingService.getAll().then((value) => {
          setState(() {
            bookings = value;
          })
        });
  }

  void _editeBookings(BookingModel booking) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => BookingEditPage(booking: booking)),
    );
    _getBookings();
  }

  void deleteBooking(BookingModel booking) {
    ConfirmDialog.show(
      context,
      'Are you sure you want to delete?',
      () => ({
        widget.bookingService
            .deleteBooking(booking)
            .then((value) => {
                  Fluttertoast.showToast(
                      msg: 'Successfully Deleted',
                      toastLength: Toast.LENGTH_LONG,
                      fontSize: 20,
                      backgroundColor: Colors.green),
                  _getBookings()
                })
            .catchError((e) => {print(e.toString())})
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // drawer: NevigationDrawer(),
        // drawer: NevigationDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 5, 156, 10),
            title: const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "My Bookings",
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
            // image: DecorationImage(
            //     image: AssetImage('assets/images/issueback.jpg'),
            //     fit: BoxFit.cover),
          ),
          child: Center(
            child: LiquidPullToRefresh(
              color: Color.fromARGB(255, 69, 231, 93),
              onRefresh: _getBookings,
              child: ListView(
                padding: const EdgeInsets.all(25.0),
                scrollDirection: Axis.vertical,
                children: bookings
                    .map((data) => Card(
                          color: Color.fromARGB(255, 230, 238, 139),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          elevation: 3,
                          child: Expanded(
                            child: ListTile(
                              leading: Text(data.vehiclename.toString()),
                              title: Text("Hours: " + data.hours.toString()),
                              subtitle:
                                  Text("Address: " + data.address.toString()),
                              trailing: PopupMenuButton(
                                onSelected: (option) {
                                  if (option == 'edit') {
                                    _editeBookings(data);
                                  } else {
                                    deleteBooking(data);
                                  }
                                },
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 'edit',
                                    child: Row(children: const [
                                      Icon(Icons.edit),
                                      SizedBox(width: 10),
                                      Text('Edit'),
                                    ]),
                                  ),
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: Row(children: const [
                                      Icon(Icons.delete),
                                      SizedBox(width: 10),
                                      Text('Delete'),
                                    ]),
                                  ),
                                ],
                              ),
                              isThreeLine: true,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget animatedHeader(String text) => Container(
        height: 30,
        margin: const EdgeInsets.only(top: 5),
        child: Marquee(
          text: text,
          style: const TextStyle(
              fontSize: 24, color: Color.fromARGB(215, 255, 255, 255)),
          blankSpace: 80,
          velocity: 100,
          pauseAfterRound: const Duration(seconds: 1),
        ),
      );
}
import 'package:agrifront/screens/updateBooking.dart';
import 'package:agrifront/services/api_service.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:marquee/marquee.dart';

import '../models/booking.model.dart';
import '../models/vehicle.model.dart';
import '../utils/confirmDialog.dart';

class Booking extends StatefulWidget {
  Booking({
    Key? key,
  }) : super(key: key);

  final BookingService bookingService = BookingService();

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<Booking> {
  List<BookingModel> bookings = [];

  @override
  void initState() {
    super.initState();
    _getBookings();
  }

  Future<void> _getBookings() async {
    widget.bookingService.getAll().then((value) => {
          setState(() {
            bookings = value;
          })
        });
  }

  void _editeBookings(BookingModel booking) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => BookingEditPage(booking: booking)),
    );
    _getBookings();
  }

  void deleteBooking(BookingModel booking) {
    ConfirmDialog.show(
      context,
      'Are you sure you want to delete?',
      () => ({
        widget.bookingService
            .deleteBooking(booking)
            .then((value) => {
                  Fluttertoast.showToast(
                      msg: 'Successfully Deleted',
                      toastLength: Toast.LENGTH_LONG,
                      fontSize: 20,
                      backgroundColor: Colors.green),
                  _getBookings()
                })
            .catchError((e) => {print(e.toString())})
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // drawer: NevigationDrawer(),
        // drawer: NevigationDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 5, 156, 10),
            title: const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "My Bookings",
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
            // image: DecorationImage(
            //     image: AssetImage('assets/images/issueback.jpg'),
            //     fit: BoxFit.cover),
          ),
          child: Center(
            child: LiquidPullToRefresh(
              color: Color.fromARGB(255, 69, 231, 93),
              onRefresh: _getBookings,
              child: ListView(
                padding: const EdgeInsets.all(25.0),
                scrollDirection: Axis.vertical,
                children: bookings
                    .map((data) => Card(
                          color: Color.fromARGB(255, 230, 238, 139),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          elevation: 3,
                          child: Expanded(
                            child: ListTile(
                              leading: Text(data.vehiclename.toString()),
                              title: Text("Hours: " + data.hours.toString()),
                              subtitle:
                                  Text("Address: " + data.address.toString()),
                              trailing: PopupMenuButton(
                                onSelected: (option) {
                                  if (option == 'edit') {
                                    _editeBookings(data);
                                  } else {
                                    deleteBooking(data);
                                  }
                                },
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 'edit',
                                    child: Row(children: const [
                                      Icon(Icons.edit),
                                      SizedBox(width: 10),
                                      Text('Edit'),
                                    ]),
                                  ),
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: Row(children: const [
                                      Icon(Icons.delete),
                                      SizedBox(width: 10),
                                      Text('Delete'),
                                    ]),
                                  ),
                                ],
                              ),
                              isThreeLine: true,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget animatedHeader(String text) => Container(
        height: 30,
        margin: const EdgeInsets.only(top: 5),
        child: Marquee(
          text: text,
          style: const TextStyle(
              fontSize: 24, color: Color.fromARGB(215, 255, 255, 255)),
          blankSpace: 80,
          velocity: 100,
          pauseAfterRound: const Duration(seconds: 1),
        ),
      );
}
import 'package:agrifront/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/booking.model.dart';

class BookingEditPage extends StatefulWidget {
  BookingEditPage({Key? key, required this.booking}) : super(key: key);

  final BookingModel booking;
  final BookingService issueService = BookingService();

  @override
  _BookingEditPageState createState() => _BookingEditPageState();
}

class _BookingEditPageState extends State<BookingEditPage> {
  final _formKey = GlobalKey<FormState>();

  late BookingModel booking;
  List<BookingModel> issues = [];

  @override
  void initState() {
    super.initState();
    // _getEmployees();
    setState(() {
      booking = widget.booking;
    });
  }
  void _save() {
    widget.issueService
        .updateBooking(booking)
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
              "Update Bookings",
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
            Positioned(
                top: 500,
                left: 0,
                child: Container(
                  width: 310,
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
                          labelText: 'Type the Contact No',
                        ),
                        initialValue: booking.contactno,
                        onChanged: (text) {
                          booking.contactno = text;
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
                        maxLength: 600,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.image),
                          border: OutlineInputBorder(),
                          labelText: 'Enter the Hours',
                        ),
                        initialValue: booking.hours,
                        onChanged: (text) {
                          booking.hours = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Hours is required!';
                          }
                          return null;
                        }),
                    const SizedBox(height: 15),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 35,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.male),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Address',
                        ),
                        initialValue: booking.address,
                        onChanged: (text) {
                          booking.address = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Address is required!';
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
import 'package:agrifront/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/booking.model.dart';

class BookingEditPage extends StatefulWidget {
  BookingEditPage({Key? key, required this.booking}) : super(key: key);

  final BookingModel booking;
  final BookingService issueService = BookingService();

  @override
  _BookingEditPageState createState() => _BookingEditPageState();
}

class _BookingEditPageState extends State<BookingEditPage> {
  final _formKey = GlobalKey<FormState>();

  late BookingModel booking;
  List<BookingModel> issues = [];

  @override
  void initState() {
    super.initState();
    // _getEmployees();
    setState(() {
      booking = widget.booking;
    });
  }
  void _save() {
    widget.issueService
        .updateBooking(booking)
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
              "Update Bookings",
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
            Positioned(
                top: 500,
                left: 0,
                child: Container(
                  width: 310,
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
                          labelText: 'Type the Contact No',
                        ),
                        initialValue: booking.contactno,
                        onChanged: (text) {
                          booking.contactno = text;
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
                        maxLength: 600,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.image),
                          border: OutlineInputBorder(),
                          labelText: 'Enter the Hours',
                        ),
                        initialValue: booking.hours,
                        onChanged: (text) {
                          booking.hours = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Hours is required!';
                          }
                          return null;
                        }),
                    const SizedBox(height: 15),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 35,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.male),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Address',
                        ),
                        initialValue: booking.address,
                        onChanged: (text) {
                          booking.address = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Address is required!';
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
import 'package:agrifront/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/booking.model.dart';

class BookingEditPage extends StatefulWidget {
  BookingEditPage({Key? key, required this.booking}) : super(key: key);

  final BookingModel booking;
  final BookingService issueService = BookingService();

  @override
  _BookingEditPageState createState() => _BookingEditPageState();
}

class _BookingEditPageState extends State<BookingEditPage> {
  final _formKey = GlobalKey<FormState>();

  late BookingModel booking;
  List<BookingModel> issues = [];

  @override
  void initState() {
    super.initState();
    // _getEmployees();
    setState(() {
      booking = widget.booking;
    });
  }
  void _save() {
    widget.issueService
        .updateBooking(booking)
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
              "Update Bookings",
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
            Positioned(
                top: 500,
                left: 0,
                child: Container(
                  width: 310,
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
                          labelText: 'Type the Contact No',
                        ),
                        initialValue: booking.contactno,
                        onChanged: (text) {
                          booking.contactno = text;
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
                        maxLength: 600,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.image),
                          border: OutlineInputBorder(),
                          labelText: 'Enter the Hours',
                        ),
                        initialValue: booking.hours,
                        onChanged: (text) {
                          booking.hours = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Hours is required!';
                          }
                          return null;
                        }),
                    const SizedBox(height: 15),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 35,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.male),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Address',
                        ),
                        initialValue: booking.address,
                        onChanged: (text) {
                          booking.address = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Address is required!';
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
import 'package:agrifront/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/booking.model.dart';

class BookingEditPage extends StatefulWidget {
  BookingEditPage({Key? key, required this.booking}) : super(key: key);

  final BookingModel booking;
  final BookingService issueService = BookingService();

  @override
  _BookingEditPageState createState() => _BookingEditPageState();
}

class _BookingEditPageState extends State<BookingEditPage> {
  final _formKey = GlobalKey<FormState>();

  late BookingModel booking;
  List<BookingModel> issues = [];

  @override
  void initState() {
    super.initState();
    // _getEmployees();
    setState(() {
      booking = widget.booking;
    });
  }
  void _save() {
    widget.issueService
        .updateBooking(booking)
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
              "Update Bookings",
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
            Positioned(
                top: 500,
                left: 0,
                child: Container(
                  width: 310,
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
                          labelText: 'Type the Contact No',
                        ),
                        initialValue: booking.contactno,
                        onChanged: (text) {
                          booking.contactno = text;
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
                        maxLength: 600,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.image),
                          border: OutlineInputBorder(),
                          labelText: 'Enter the Hours',
                        ),
                        initialValue: booking.hours,
                        onChanged: (text) {
                          booking.hours = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Hours is required!';
                          }
                          return null;
                        }),
                    const SizedBox(height: 15),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 35,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.male),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Address',
                        ),
                        initialValue: booking.address,
                        onChanged: (text) {
                          booking.address = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Address is required!';
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
import 'package:agrifront/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/booking.model.dart';

class BookingEditPage extends StatefulWidget {
  BookingEditPage({Key? key, required this.booking}) : super(key: key);

  final BookingModel booking;
  final BookingService issueService = BookingService();

  @override
  _BookingEditPageState createState() => _BookingEditPageState();
}

class _BookingEditPageState extends State<BookingEditPage> {
  final _formKey = GlobalKey<FormState>();

  late BookingModel booking;
  List<BookingModel> issues = [];

  @override
  void initState() {
    super.initState();
    // _getEmployees();
    setState(() {
      booking = widget.booking;
    });
  }
  void _save() {
    widget.issueService
        .updateBooking(booking)
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
              "Update Bookings",
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
            Positioned(
                top: 500,
                left: 0,
                child: Container(
                  width: 310,
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
                          labelText: 'Type the Contact No',
                        ),
                        initialValue: booking.contactno,
                        onChanged: (text) {
                          booking.contactno = text;
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
                        maxLength: 600,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.image),
                          border: OutlineInputBorder(),
                          labelText: 'Enter the Hours',
                        ),
                        initialValue: booking.hours,
                        onChanged: (text) {
                          booking.hours = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Hours is required!';
                          }
                          return null;
                        }),
                    const SizedBox(height: 15),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 35,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.male),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Address',
                        ),
                        initialValue: booking.address,
                        onChanged: (text) {
                          booking.address = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Address is required!';
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
import 'package:agrifront/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/booking.model.dart';

class BookingEditPage extends StatefulWidget {
  BookingEditPage({Key? key, required this.booking}) : super(key: key);

  final BookingModel booking;
  final BookingService issueService = BookingService();

  @override
  _BookingEditPageState createState() => _BookingEditPageState();
}

class _BookingEditPageState extends State<BookingEditPage> {
  final _formKey = GlobalKey<FormState>();

  late BookingModel booking;
  List<BookingModel> issues = [];

  @override
  void initState() {
    super.initState();
    // _getEmployees();
    setState(() {
      booking = widget.booking;
    });
  }
  void _save() {
    widget.issueService
        .updateBooking(booking)
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
              "Update Bookings",
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
            Positioned(
                top: 500,
                left: 0,
                child: Container(
                  width: 310,
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
                          labelText: 'Type the Contact No',
                        ),
                        initialValue: booking.contactno,
                        onChanged: (text) {
                          booking.contactno = text;
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
                        maxLength: 600,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.image),
                          border: OutlineInputBorder(),
                          labelText: 'Enter the Hours',
                        ),
                        initialValue: booking.hours,
                        onChanged: (text) {
                          booking.hours = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Hours is required!';
                          }
                          return null;
                        }),
                    const SizedBox(height: 15),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 35,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.male),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Address',
                        ),
                        initialValue: booking.address,
                        onChanged: (text) {
                          booking.address = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Address is required!';
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
import 'package:agrifront/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/booking.model.dart';

class BookingEditPage extends StatefulWidget {
  BookingEditPage({Key? key, required this.booking}) : super(key: key);

  final BookingModel booking;
  final BookingService issueService = BookingService();

  @override
  _BookingEditPageState createState() => _BookingEditPageState();
}

class _BookingEditPageState extends State<BookingEditPage> {
  final _formKey = GlobalKey<FormState>();

  late BookingModel booking;
  List<BookingModel> issues = [];

  @override
  void initState() {
    super.initState();
    // _getEmployees();
    setState(() {
      booking = widget.booking;
    });
  }
  void _save() {
    widget.issueService
        .updateBooking(booking)
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
              "Update Bookings",
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
            Positioned(
                top: 500,
                left: 0,
                child: Container(
                  width: 310,
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
                          labelText: 'Type the Contact No',
                        ),
                        initialValue: booking.contactno,
                        onChanged: (text) {
                          booking.contactno = text;
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
                        maxLength: 600,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.image),
                          border: OutlineInputBorder(),
                          labelText: 'Enter the Hours',
                        ),
                        initialValue: booking.hours,
                        onChanged: (text) {
                          booking.hours = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Hours is required!';
                          }
                          return null;
                        }),
                    const SizedBox(height: 15),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 35,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.male),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Address',
                        ),
                        initialValue: booking.address,
                        onChanged: (text) {
                          booking.address = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Address is required!';
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
import 'package:agrifront/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/booking.model.dart';

class BookingEditPage extends StatefulWidget {
  BookingEditPage({Key? key, required this.booking}) : super(key: key);

  final BookingModel booking;
  final BookingService issueService = BookingService();

  @override
  _BookingEditPageState createState() => _BookingEditPageState();
}

class _BookingEditPageState extends State<BookingEditPage> {
  final _formKey = GlobalKey<FormState>();

  late BookingModel booking;
  List<BookingModel> issues = [];

  @override
  void initState() {
    super.initState();
    // _getEmployees();
    setState(() {
      booking = widget.booking;
    });
  }
  void _save() {
    widget.issueService
        .updateBooking(booking)
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
              "Update Bookings",
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
            Positioned(
                top: 500,
                left: 0,
                child: Container(
                  width: 310,
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
                          labelText: 'Type the Contact No',
                        ),
                        initialValue: booking.contactno,
                        onChanged: (text) {
                          booking.contactno = text;
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
                        maxLength: 600,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.image),
                          border: OutlineInputBorder(),
                          labelText: 'Enter the Hours',
                        ),
                        initialValue: booking.hours,
                        onChanged: (text) {
                          booking.hours = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Hours is required!';
                          }
                          return null;
                        }),
                    const SizedBox(height: 15),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 35,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.male),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Address',
                        ),
                        initialValue: booking.address,
                        onChanged: (text) {
                          booking.address = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Address is required!';
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
