import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:nad_app/presentation/app_scaffold.dart';
import 'package:nad_app/theme/style.dart';

class HtmlScaffold extends StatelessWidget {
  final String html;
  final String title;

  HtmlScaffold({this.title, this.html});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: title,
      body: SingleChildScrollView(
        child: Html(
          data: html,
          //Optional parameters:
          style: {
            "html": Style(
              backgroundColor: Colors.transparent,
//              color: Colors.white,
            ),
//            "h1": Style(
//              textAlign: TextAlign.center,
//            ),
            "table": Style(
              backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
            ),
            "tr": Style(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            "th": Style(
              padding: EdgeInsets.all(6),
              backgroundColor: Colors.grey,
            ),
            "td": Style(
              padding: EdgeInsets.all(6),
            ),
            "var": Style(fontFamily: 'serif'),
          },
        ),
      ),
    );
  }
}