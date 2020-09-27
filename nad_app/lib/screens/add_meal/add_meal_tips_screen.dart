import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:nad_app/presentation/html_scaffold.dart';

const htmlData = """
<p>Una corretta registrazione dei consumi alimentari deve prevedere la tenuta di un diario giornaliero per 7 giorni consecutivi (una settimana)</p>

<p>Per ogni alimento assunto deve essere registrato il tipo di confezione e la quantit&agrave; rilevata al crudo o al cotto (es.: " pasta g. 70 cruda e condita con pomodoro, burro e parmigiano oppure pasta al rag&ugrave; e forma g. 200 cotta")</p>

<p>Per alcuni alimenti la segnalazione delle quantit&agrave; pu&ograve; essere riferita a misure di tipo casalingo (es.: zucchero un cucchiaino da caff&egrave;, latte intero una tazza,ecc.)</p>

<p>I derivati del pane, tipo grissini o crackers possono essere segnalati a numero o a pacchetti, comunque leggere sempre le etichette dei prodotti che spesso informano sugli ingredienti e il valore calorico del prodotto ed eventualmente segnalarlo.</p>

<p>I formaggi , i condimenti, i dolci , vanno indicati secondo la qualit&agrave; e quantit&agrave; di riferimento (grammi, fette, cucchiaini,ecc.)</p>

<p>Per le carni , i pesci e le verdure indicare il anche il tipo di cottura. Ricordare di segnalare l'eventuale consumo di legumi, e patate.</p>

<p>Non dimenticare eventuali spuntini o caramelle o cioccolata o altro assunti fuori pasto e la qualit&agrave; e quantit&agrave; di bevante tipo vino, bibita, alcoolici eventualmente consumati.</p>

<p>Le giornate ‑ diario devono quindi essere descrittive e personalizzate il pi&ugrave; possibile, verranno verificate e discusse con il medico e la dietista</p>
""";

class AddMealTipsScreen extends StatelessWidget {
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
