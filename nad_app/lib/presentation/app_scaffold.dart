import 'package:flutter/material.dart';
import 'package:nad_app/theme/style.dart';

class AppScaffold extends StatelessWidget {
  final Key key;
  final Widget body;
  final bool hasBack;
  final String title;
  final Widget fab;
  final Widget action;

  AppScaffold({this.key, this.hasBack = true, this.title, this.fab, this.body, this.action});

  List<Widget> _getActions() {
    if (this.action != null) {
      return [this.action, SizedBox(width: 10)];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this.key,
      backgroundColor: LIGHT_GRAY_COLOR,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, size: 30,), onPressed: () => {
          Navigator.of(context).pop()
        },),
        iconTheme: IconThemeData(
          color: ALMOST_BLACK_COLOR,
          size: 40,
        ),
        title: Text(title, style: TextStyle(
          color: ALMOST_BLACK_COLOR,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        )),
        backgroundColor: Colors.transparent,
        actions: _getActions(),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: body,
      ),
      floatingActionButton: fab,
    );
  }

}