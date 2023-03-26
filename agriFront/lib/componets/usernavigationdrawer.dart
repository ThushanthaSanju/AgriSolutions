import 'package:agrifront/screens/admin/adminSignin.dart';
import 'package:agrifront/screens/home.dart';
import 'package:flutter/material.dart';

import '../screens/bookings.dart';
import '../screens/fruits.dart';
import '../screens/myOrders.dart';
import '../screens/vegitables.dart';
import '../screens/vehicle.dart';
import 'custom_page_route.dart';

class NevigationDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  NevigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = 'Public User';
    final email = 'public@lifes.com';
    final urlImage = 'assets/images/user.png';

    return Drawer(
      child: Material(
        color: const Color.fromARGB(255, 5, 156, 10),
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () {},
            ),
            const SizedBox(height: 8),
            const Divider(color: Colors.white70),
            buildMenuItem(
                text: 'Home',
                icon: Icons.home,
                onClicked: () => selectedItem(context, 0)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'Fruits',
                icon: Icons.apple,
                onClicked: () => selectedItem(context, 1)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'Vegitables',
                icon: Icons.grass,
                onClicked: () => selectedItem(context, 2)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'Vehicles',
                icon: Icons.car_rental,
                onClicked: () => selectedItem(context, 3)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'My Orders',
                icon: Icons.money_off_csred_rounded,
                onClicked: () => selectedItem(context, 4)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'My Bookings',
                icon: Icons.book_online,
                onClicked: () => selectedItem(context, 5)),
            const SizedBox(height: 16),
            const Divider(color: Colors.white70),
            buildMenuItem(
                text: 'Admin Login',
                icon: Icons.admin_panel_settings,
                onClicked: () => selectedItem(context, 6)),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback? onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(children: [
            CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                backgroundImage: AssetImage(urlImage)),
            SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )
              ],
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 24,
              backgroundColor: Color.fromARGB(255, 154, 156, 5),
              child: Icon(Icons.verified_user_outlined, color: Colors.white),
            )
          ]),
        ),
      );
}

void selectedItem(BuildContext context, int i) {
  switch (i) {
    case 0:
      Navigator.of(context)
          .push(CustomPageRoute(child: Home(), direction: AxisDirection.up));
      break;
    case 1:
      Navigator.of(context).push(CustomPageRoute(
          child: FruitsService(), direction: AxisDirection.left));
      break;
    case 2:
      Navigator.of(context).push(CustomPageRoute(
          child: VegitableService(), direction: AxisDirection.left));
      break;
    case 3:
      Navigator.of(context).push(CustomPageRoute(
          child: VehiclsService(), direction: AxisDirection.left));
      break;
    case 4:
      Navigator.of(context).push(
          CustomPageRoute(child: MyOrders(), direction: AxisDirection.left));
      break;
    case 5:
      Navigator.of(context).push(
          CustomPageRoute(child: Booking(), direction: AxisDirection.left));
      break;
    case 6:
      Navigator.of(context).push(
          CustomPageRoute(child: Signin(), direction: AxisDirection.left));
      break;
    case 7:
      // Navigator.of(context).push(
      //     CustomPageRoute(child: Signin(), direction: AxisDirection.down));
      break;
  }
}
