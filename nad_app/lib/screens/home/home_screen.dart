import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/actions/sync_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/presentation/big_button.dart';
import 'package:nad_app/presentation/fading_scaffold.dart';
import 'package:nad_app/routes.dart';
import 'package:nad_app/screens/home/home_card.dart';
import 'package:nad_app/screens/home/home_drawer.dart';
import 'package:nad_app/screens/login/login_phase_one_form.dart';
import 'package:nad_app/theme/style.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: "HomeScreen");

  List<Widget> generateCards(BuildContext context) {
    var cards = [
      HomeCard(
          image: "assets/diario.png",
          label: "Diario alimentare",
          onPressed: () => {Navigator.of(context).pushNamed(DIARY_ROUTE)}),
      HomeCard(
          image: "assets/bilancio.png",
          label: "Bilancio idrico",
          onPressed: () => {Navigator.of(context).pushNamed(BALANCE_ROUTE)}),
      HomeCard(
          image: "assets/referti.png",
          label: "I miei referti",
          onPressed: () => {Navigator.of(context).pushNamed(REPORTS_ROUTE)}),
      HomeCard(
          image: "assets/informati.png",
          label: "Informati",
          onPressed: () =>
              {Navigator.of(context).pushNamed(USEFUL_INFORMATION_ROUTE)}),
      HomeCard(
        image: "assets/centroiicb.png",
        label: "Contatta centro IICB",
        onPressed: () => {Navigator.of(context).pushNamed(CONTACT_ROUTE)},
      ),
    ];

    // Add the spacing between them
    List<Widget> spacedCards = List();
    cards.forEach((card) {
      spacedCards.add(card);
      spacedCards.add(SizedBox(height: 20));
    });
    return spacedCards;
  }

  Widget _getLogo(bool isSyncing) {
    if (isSyncing) {
      return FadeIn(
        key: UniqueKey(),
        child: Container(
          height: 130,
          width: 130,
          padding: EdgeInsets.all(30),
          child: CircularProgressIndicator(
              value: null,
              strokeWidth: 8,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
        ),
      );
    } else {
      return FadeIn(
          key: UniqueKey(),
          child: Image.asset("assets/logowhite.png", height: 130));
    }
  }

  String _getHelpText(AppState appState) {
    if (appState.sync.isSyncing) {
      return "sincronizzazione in corso...";
    } else {
      return "come posso aiutarti?";
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, appState) {
        final darkTheme =
            Theme.of(context).copyWith(textTheme: homeTextTheme());
        return Theme(
            data: darkTheme,
            child: FadingScaffold(
              scaffoldKey: scaffoldKey,
              delay: 200,
              gradient: true,
              onRefresh: () async {
                StoreProvider.of<AppState>(context).dispatch(RequestSync());
              },
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInLeft(
                      child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 40,
                          semanticLabel: 'Apri menu',
                        ),
                        onPressed: () {
                          scaffoldKey.currentState.openDrawer();
                        },
                      ),
                      preferences: AnimationPreferences(
                          offset: Duration(milliseconds: 500)),
                    ),
                    _getLogo(appState.sync.isSyncing),
                    FadeInRight(
                      child: IconButton(
                        icon: Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 40,
                          semanticLabel: 'Contatti',
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(CONTACT_ROUTE);
                        },
                      ),
                      preferences: AnimationPreferences(
                          offset: Duration(milliseconds: 500)),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text("Buongiorno,",
                    style: darkTheme.textTheme.headline1),
                SizedBox(height: 5),
                Text(_getHelpText(appState),
                    style: darkTheme.textTheme.headline2),
                SizedBox(height: 30),
                ...generateCards(context),
              ],
              drawer: homeDrawer(context,
                onLogout: () {
                  StoreProvider.of<AppState>(context).dispatch(LogoutRequest());
                }
              ),
            ));
      },
      onWillChange: (previousState, state) {
        if (previousState.sync.error == null && state.sync.error != null) {
          final snackBar = SnackBar(content: Text(state.sync.error));
          scaffoldKey.currentState.showSnackBar(snackBar);
        }
      },
    );
  }
}