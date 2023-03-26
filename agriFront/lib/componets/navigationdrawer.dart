import 'package:agrifront/screens/admin/userAdmin/user.dart';
import 'package:agrifront/screens/loginScreen.dart';
import 'package:flutter/material.dart';

import '../screens/admin/adminHome.dart';
import '../screens/admin/orderAdmin/orderlist.dart';
import '../screens/admin/productsAdmin/productList.dart';
import '../screens/admin/vehicleAdmin/vehicleList.dart';
import 'custom_page_route.dart';

class NevigationDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  NevigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = 'Admin Panel';
    final email = 'admin@lifes.com';
    final urlImage =
        'https://png.pngtree.com/png-clipart/20190924/original/pngtree-administration-icon-in-trendy-style-isolated-background-png-image_4829127.jpg';

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
                text: 'Product Management',
                icon: Icons.production_quantity_limits,
                onClicked: () => selectedItem(context, 1)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'Vehicle Management',
                icon: Icons.car_rental,
                onClicked: () => selectedItem(context, 2)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'Order Management',
                icon: Icons.money_off_csred_rounded,
                onClicked: () => selectedItem(context, 3)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'User Management',
                icon: Icons.person,
                onClicked: () => selectedItem(context, 4)),
            const SizedBox(height: 16),
            const Divider(color: Colors.white70),
            buildMenuItem(
                text: 'Logout',
                icon: Icons.logout,
                onClicked: () => selectedItem(context, 5)),
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
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
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
              backgroundColor: Color.fromARGB(255, 134, 12, 172),
              child: Icon(Icons.admin_panel_settings_outlined,
                  color: Colors.white),
            )
          ]),
        ),
      );
}

void selectedItem(BuildContext context, int i) {
  switch (i) {
    case 0:
      Navigator.of(context).push(
          CustomPageRoute(child: AdminHome(), direction: AxisDirection.up));
      break;
    case 1:
      Navigator.of(context).push(CustomPageRoute(
          child: ProdcutsView(), direction: AxisDirection.left));
      break;
    case 2:
      Navigator.of(context).push(
          CustomPageRoute(child: VehicleView(), direction: AxisDirection.left));
      break;
    case 3:
      Navigator.of(context).push(
          CustomPageRoute(child: MyOrders(), direction: AxisDirection.left));
      break;
    case 4:
      Navigator.of(context).push(
          CustomPageRoute(child: UserView(), direction: AxisDirection.left));
      break;
    case 5:
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const UserSignin()),
          (route) => false);
      break;
  }
}
