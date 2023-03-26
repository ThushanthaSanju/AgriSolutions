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
