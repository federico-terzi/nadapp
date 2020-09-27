import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:nad_app/presentation/html_scaffold.dart';

const htmlData = """
<h2>Terapia e prognosi della IICB</h2>
<p><strong>La terapia</strong></p>
<p>L’obiettivo della terapia è quello di raggiungere e/o mantenere:</p>
<ul>
<li>la miglior funzione intestinale</li>
<li>il miglior stato di nutrizione</li>
<li>la miglior qualità di vita possibile nel singolo caso</li>
</ul>
<p>La terapia può essere sia medica che chirurgica, e può essere spesso attuata in associazione.</p>
<ol>
<li>La terapia medica consiste in:
<ul>
<li>farmaci che regolano la secrezione, la motilità intestinale e la crescita batterica intestinale;</li>
<li>agenti trofici per la mucosa intestinale;</li>
<li>soluzioni reidratanti orali;</li>
<li>diete speciali, compresa la nutrizione artificiale di tipo enterale (attraverso l’apparato digerente);</li>
<li>nutrizione artificiale di parenterale domiciliare (per via venosa effettuata a domicilio).</li>
</ul>
</li>
<li>La terapia chirurgica consiste in:
<ul>
<li>interventi chirurgici mirati ad aumentare la superficie intestinale assorbente o a modificare il transito intestinale;</li>
<li>trapianto di intestino.</li>
</ul>
</li>
</ol>
<p><strong>Scelta della terapia</strong><br /><br />Quando il recupero della funzione intestinale non avviene, le uniche possibilità terapeutiche sono la Nutrizione Parenterale Domiciliare e il Trapianto di Intestino, le quali sono quindi due terapie salvavita.<br /><br />La Nutrizione Parenterale Domiciliare consente al paziente di nutrirsi adeguatamente, attraverso l’infusione delle sostanze nutritive direttamente nelle vene, per mezzo di speciali cateteri (intestino artificiale). Il paziente impara ad effettuarla da solo a domicilio, di solito durante le ore notturne, mentre di giorno può condurre una vita normale. La NPD è una terapia sostitutiva della funzione d’organo persa, paragonabile alla dialisi per i pazienti con insufficienza renale (rene artificiale).<br /><br />Il trapianto d’intestino, consiste nella sostituzione dell’intestino malato con un intestino sano prelevato da donatore; il trapianto di intestino è definito isolato, quando viene trapiantato solo l’intestino tenue, oppure multi viscerale quando vengono trapiantati contemporaneamente anche altri organi come il fegato, il pancreas, lo stomaco). Il trpianto di intestino è la terapia curativa dell’insufficienza intestinale.<br /><br />La scelta tra trattamento sostitutivo (la nutrizione parenterale domiciliare) e trattamento definitivo (trapianto di intestino) della IICB irreversibile si basa sul confronto tra l’efficacia e la sicurezza di ciascuna delle due terapie. Per efficacia si intende la sopravvivenza, il grado di recupero e mantenimento dello stato di nutrizione, il grado di riabilitazione socio-lavorativa e di qualità di vita e per sicurezza si intende il rischio di complicanze.<br /><br />Attualmente, a livello internazionale,<strong> la nutrizione parenterale domiciliare</strong>, condotta attraverso appropriati protocolli clinico-organizzativi, <strong>viene considerata la prima opzione terapeutica </strong>per i pazienti con IICB irreversibile.<br />Il trapianto di intestino è indicato quando non è più possibile continuare la nutrizione parenterale oppure quando la malattia gastrointestinale mette a rischio la vita del paziente.<br /><br />Poiché l'esito del trapianto di intestino è migliore nei pazienti che vengono sottoposti ad intervento mentre sono ancora in buone condizioni generali, è ritenuta fondamentale la precoce individuazione dei pazienti candidati all’intervento.<br />Va tenuto conto che <strong>nella scelta tra nutrizione parenterale domiciliare e trapianto di intestino hanno un ruolo decisivo le controindicazioni che ciascun trattamento può avere</strong>. Mentre non esistono praticamente controindicazioni assolute alla nutrizione parenterale domiciliare, per cui è sempre possibile fare questa terapia. Al contrario, esistono diverse controindicazioni al trapianto di intestino, per cui anche in presenza di precise indicazioni, non sempre è possibile fare l’intervento. &nbsp;</p>
<p><strong>Prognosi dei pazienti con insufficienza intestinale cronica benigna senza controindicazioni al trapianto di intestino</strong><br /><strong><br />Sopravvivenza</strong><br /><br /><strong>Nei pazienti in nutrizione parenterale domiciliare,</strong> la prognosi dipende essenzialmente da fattori relativi al paziente e alla malattia di base, mentre sono rari i decessi dovuti a complicanze della terapia. <strong>La sopravvivenza a 5 anni è risultata del 87%</strong>, con una riduzione al 83% in caso di complicanze gravi dovute al catetere venoso centrale e al 56% sin caso di sviluppo di insufficienza epatica.<br /><br /><strong>La prognosi post-trapianto di intestino dipende essenzialmente dal tipo di protocollo immunosoppressivo utilizzato e dalle condizioni generali del paziente al momento del trapianto</strong>. Quasi tutti i decessi post-trapianto sono dovuti a rigetto o a complicanze della terapia immunosoppressiva. <strong>La sopravvivenza a 5 anni è risultata del 54%</strong>, con un aumento fino al 78% (miglior dato ottenuto in letteratura) in coloro che sono stati sottoposti a trapianto di intestino isolato e che erano in buone condizioni al momento del trapianto.<br /><br /><strong>Efficacia nutrizionale</strong><br /><br />La maggior parte dei pazienti in nutrizione parenterale domiciliare raggiunge e mantiene uno stato di nutrizione di grado discreto/buono.<br />Il 75% dei dei pazienti che si sottopongono a trapianto di intestino raggiunge la piena sufficienza intestinale, mentre circa il 25% continua ad avere necessità di nutrizione o idratazione parenterale domiciliare.<br /><br /><strong>Qualità di vita</strong><br /><br />Nei pazienti in nutrizione parenterale domiciliare è stata osservata una riduzione della qualità di vita legata alla componente fisica mentre la qualità di vita legata alla componente emotiva era uguale a quella dei soggetti sani. Nel complesso, i risultati sono simili a quelli ottenuti in pazienti in dialisi per insufficienza renale.<br />Confrontando poi la qualità di vita dei pazienti in nutrizione parenterale domiciliare con quelli sottoposti a trapianto di intestino, senza complicanze in atto e senza necessità di catetere venoso centrale, il punteggio della qualità di vita è risultato migliore nei trapiantati.<br /><br />&nbsp;</p></div>
""";

class UsefulInformationIICBTherapyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MealState>(
        converter: (store) => store.state.meal,
        builder: (context, mealState) {
          return HtmlScaffold(
            title: "Terapia e prognosi",
            html: htmlData,
          );
        });
  }
}
