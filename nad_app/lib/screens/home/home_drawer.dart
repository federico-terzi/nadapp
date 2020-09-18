import 'package:flutter/material.dart';
import 'package:nad_app/theme/style.dart';

const DRAWER_ICON_SIZE = 36.0;

Drawer homeDrawer(BuildContext context) {
  return Drawer(
    child: Theme(
      data: Theme.of(context).copyWith(textTheme: appTheme().textTheme),
      child: Column(
        children: [
          Flexible(
            flex: 10,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 95,
                  child: DrawerHeader(
                    child: Text("Impostazioni",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26)),
                    decoration: BoxDecoration(
                      color: MAIN_COLOR,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle, size: DRAWER_ICON_SIZE),
                  title: Text('I miei medici'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  leading: Icon(Icons.vpn_key, size: DRAWER_ICON_SIZE),
                  title: Text('Cambia password'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app, size: DRAWER_ICON_SIZE),
                  title: Text('Logout'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "NAD-APP è un'applicazione del Centro IICB dell'Osp. Sant'Orsola di Bologna",
                style: TextStyle(color: Color.fromRGBO(99, 110, 114, 1.0), fontSize: 15)),
          )
        ],
      ),
    ),
  );
}
