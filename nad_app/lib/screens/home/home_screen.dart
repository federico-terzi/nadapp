import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/presentation/big_button.dart';
import 'package:nad_app/presentation/fading_scaffold.dart';
import 'package:nad_app/screens/home/home_card.dart';
import 'package:nad_app/screens/home/home_drawer.dart';
import 'package:nad_app/screens/login/login_phase_one_form.dart';
import 'package:nad_app/theme/style.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: "Test");

  List<Widget> generateCards() {
    var cards = [
      HomeCard(
          image: "assets/diario.png",
          label: "Diario alimentare",
          onPressed: () => {}),
      HomeCard(
          image: "assets/bilancio.png",
          label: "Bilancio idrico",
          onPressed: () => {}),
      HomeCard(
          image: "assets/referti.png",
          label: "I miei referti",
          onPressed: () => {}),
      HomeCard(
          image: "assets/informati.png",
          label: "Informati",
          onPressed: () => {}),
      HomeCard(
          image: "assets/centroiicb.png",
          label: "Contatta centro IICB",
          onPressed: () => {}),
    ];

    // Add the spacing between them
    List<Widget> spacedCards = List();
    cards.forEach((card) {
      spacedCards.add(card);
      spacedCards.add(SizedBox(height: 20));
    });
    return spacedCards;
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
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 45,
                      semanticLabel: 'Apri menu',
                    ),
                    onPressed: () {
                      scaffoldKey.currentState.openDrawer();
                    },
                  ),
                  Image.asset("assets/logowhite.png", height: 130),
                  IconButton(
                    icon: Icon(
                      Icons.help,
                      color: Colors.white,
                      size: 45,
                      semanticLabel: 'Aiuto',
                    ),
                    onPressed: () {
                      // TODO
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text("Buongiorno ${appState.auth.user.name},",
                  style: darkTheme.textTheme.headline1),
              SizedBox(height: 5),
              Text("come posso aiutarti?",
                  style: darkTheme.textTheme.headline2),
              SizedBox(height: 30),
              ...generateCards(),
            ],
            drawer: homeDrawer,
          )
        );
      },
    );
  }
}