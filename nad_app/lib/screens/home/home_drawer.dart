import 'package:flutter/material.dart';
import 'package:nad_app/theme/style.dart';

Drawer homeDrawer() {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 90,
          child: DrawerHeader(
            child: Text("Impostazioni"),
            decoration: BoxDecoration(
              color: MAIN_COLOR,
            ),
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    ),
  );
}