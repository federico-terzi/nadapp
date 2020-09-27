import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:nad_app/presentation/html_scaffold.dart';

const htmlData = """
<p>Il <b>peso</b> va misurato al mattino a digiuno, sempre alla stessa ora, sulla stessa bilancia, senza vestiti o con gli stessi vestiti.</p>

<p><b>Diuresi e volume stomia</b>: il mattino, al risveglio, e prima della colazione gettare le prime urine/feci. Da quel momento per le successive 24 ore raccogliere tutte le urine/feci negli appositi contenitori.</p>

<p><b>Diuresi minima da raggiungere</b>: 800 ml/24h</p>

<p><b>Liquidi per OS</b>: annotare (approssivativamente) le quantità di tutti i liquidi ingeriti (acqua, bibite, tè, caffè, latte, succhi di frutta, etc).</p>
""";

class AddBalanceTipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MealState>(
        converter: (store) => store.state.meal,
        builder: (context, mealState) {
          return HtmlScaffold(
            title: "Consigli utili",
            html: htmlData,
          );
        });
  }
}
