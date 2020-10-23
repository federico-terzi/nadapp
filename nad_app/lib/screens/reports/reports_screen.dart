import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/actions/report_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/report.dart';
import 'package:nad_app/models/report_state.dart';
import 'package:nad_app/models/report.dart';
import 'package:nad_app/models/report.dart';
import 'package:nad_app/presentation/app_fab.dart';
import 'package:nad_app/presentation/app_scaffold.dart';
import 'package:nad_app/presentation/big_icon_button.dart';
import 'package:nad_app/routes.dart';
import 'package:nad_app/utils/date_utils.dart';

class ReportsScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey =
  GlobalKey<ScaffoldState>(debugLabel: "ReportsScreen");

  ListView _getReports(List<Report> reports, Set<int> downloadingReports) {
    return ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          int reverseIndex = reports.length - index - 1;
          int reportId = reports[reverseIndex].id;
          return GestureDetector(
            onTap: () {
              StoreProvider.of<AppState>(context).dispatch(OpenReportRequest(id: reportId));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ListTile(
                  leading: (downloadingReports.contains(reportId)) ? CircularProgressIndicator(value: null) : Icon(Icons.description, size: 40),
                  title: Text(
                      getFullFormattedDate(reports[reverseIndex].date), style: Theme
                      .of(context)
                      .textTheme
                      .headline4),
                  subtitle:
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text("Clicca per visualizzare", style: Theme
                        .of(context)
                        .textTheme
                        .bodyText2),
                  ),
                ),
              ),
            ),
          );
        });
  }

  void gotoAddMealScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ADD_MEAL_ROUTE);
  }

  List<Widget> _getContent(BuildContext context, List<Report> reports, Set<int> downloadingReports) {
    if (reports.length > 0) {
      return [
        Expanded(child: _getReports(reports, downloadingReports)),
      ];
    } else {
      return [
        Text(
          "Non hai ancora nessun referto.",
          textAlign: TextAlign.center,
          style: Theme
              .of(context)
              .textTheme
              .bodyText1,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ReportState>(
        converter: (store) => store.state.report,
        builder: (context, reportState) {
          return AppScaffold(
            globalKey: scaffoldKey,
            title: "Referti",
            body: Column(
              children: [
                ..._getContent(context, reportState.reports, reportState.downloadingReports)
              ],
            ),
          );
        },
      onWillChange: (previousState, state) {
        if (previousState.error == null && state.error != null) {
          final snackBar = SnackBar(content: Text(state.error));
          scaffoldKey.currentState.showSnackBar(snackBar);
        }
      },);
  }
}
