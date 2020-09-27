import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:nad_app/presentation/html_scaffold.dart';

const htmlData = """
<h2>Insufficienza intestinale intestinale cronica benigna (IICB)</h2>
<p><strong>Cos'è?</strong></p>
<ul>
<li>La funzione dell’intestino è quella di digerire i cibi e di assorbire le sostanze nutritive in essi contenuti.</li>
<li>Una normale funzione intestinale è indispensabile per mantenere un normale stato di nutrizione.</li>
<li><strong>L’insufficienza intestinale si verifica quando la funzione intestinale si riduce sotto il minimo necessario per mantenere un normale stato di nutrizione</strong>.</li>
</ul>
<p><br /><strong>Quali sono le conseguenze</strong><br />La conseguenza dell’insufficienza intestinale è la malnutrizione. Quando non viene trattata, l’insufficienza intestinale può causare la morte per denutrizione.<br /><br /><strong>Frequenza</strong></p>
<ul>
<li>Ogni anno ci sono <strong>circa 5-6 nuovi casi per milione di abitanti</strong>.</li>
<li><strong>La terapia medica e chirurgica consente di recuperare una funzione intestinale sufficiente in circa la metà dei casi</strong> (insufficienza intestinale reversibile).</li>
<li>Nell’altra metà, questo non è possibile (insufficienza intestinale irreversibile). In questi casi la funzione intestinale viene sostituita dalla <strong>nutrizione parenterale domiciliare</strong> oppure, in casi molto selezionati, si ricorre al <strong>trapianto di intestino</strong>.</li>
<li>In Italia, i pazienti in nutrizione parenterale domiciliare per insufficienza intestinale cronica benigna sono <strong>circa 5 per milione di abitanti e, tra il 2000 e il 2010, sono stati eseguiti 45 trapianti di intestino</strong>.</li>
<li>La IICB è quindi una <strong>condizione patologica rara</strong>.</li>
</ul>
<p><br /><strong>Quali sono le cause della IICB</strong><br />L’insufficienza intestinale può essere dovuta a quattro condizioni patologiche:</p>
<ol>
<li><strong>sindrome da intestino corto</strong>: si verifica quando manca gran parte dell’intestino; la conseguenza è il malassorbimento, cioè l’individuo non assorbe quello che mangia; l’intestino corto è la conseguenza di interventi chirurgici di resezione intestinale; può essere presente alla nascita per malformazioni congenite; l’intestino è la causa più frequente di insufficienza intestinale cronica (circa il 70% dei casi);</li>
<li><strong>alterazioni croniche della motilità intestinale</strong>: si verifica quando la progressione degli alimenti lungo il tubo digerente è bloccata o ostacolata; la conseguenza principale è la riduzione dell’alimentazione per evitare i sintomi causati dalla presenza di alimenti nell’intestino (nausea, vomito, gonfiore e dolore addominale);</li>
<li><strong>alterazioni diffuse e non reversibili della mucosa intestinale</strong>: si verifica quando gran parte dell’intestino è colpito da una malattia che non consente l’assorbimento delle sostanze nutritive; anche in questo caso la conseguenza è il malassorbimento, cioè l’individuo non assorbe quello che mangia;</li>
<li><strong>fistole intestinali</strong>: quando si formano dei collegamenti diretti tra l’intestino e la parete addominale oppure tra 2 tratti di intestino distanti tra loro, con perdite di gran parte degli alimenti, prima che avvenga l’assorbimento; anche in questo caso la conseguenza è il malassorbimento, cioè l’individuo non assorbe quello che mangia.</li>
</ol>
<p>&nbsp;<strong>Quali sono le malattie nelle quali può comparire l'insufficienza intestinale cronica</strong></p>
<ul>
<li><strong>Malattie che possono essere causa di resezioni intestinali estese (sindrome da intestino corto) o di fistole intestinali</strong><br />infarto intestinale, ischemia arteriosa mesenterica, trombosi venosa mesenterica, morbo di Crohn, enterite da radiazioni (o enterite attinica), trauma addominale, volvolo intestinale, poliposi familiare (sindrome di Gardner) con o senza desmoidi, angiodisplasia intestinale, complicanze di interventi chirurgici addominali (peritonite diffusa, fistole).</li>
<li><strong>Malattie che possono essere causa di malassorbimento intestinale o alterato transito intestinale</strong><br />gastroresezione, gastroparesi, resezione pancreatica, diversione bilio-pancreatica, morbo Celiaco, rigetto intestinale post trapianto di midollo (GVHD, rigetto cronico post trapianto di intestino, disordini congeniti della mucosa intestinale (atrofia dei microvilli, displasia epiteliale o tufting enteropathy), linfangectasia intestinale, atresia intestinale (gastroschisi), enterocolite necrotizzante, diarrea cronica congenita, pseudo-ostruzione intestinale idiopatica o primitiva (Hirschsprung), pseudo-ostruzione intestinale secondaria (da sclerodermia, diabete mellito), enteropatia protido-disperdente, fibrosi cistica, malattia di Von Recklinghausen, Mitochondrial neurogastrointestinal encephalomyopathy (MNGIE).</li>
</ul>
<p><strong>IMPORTANTE</strong><br />Le malattie sopra elencate sono malattie il cui decorso può complicarsi con una insufficienza intestinale (in alcuni casi si tratta di malattie rare), <strong>avere una di esse non vuol dire avere un'insufficienza intestinale ma vuol dire essere a rischio di insufficienza intestinale</strong> (la cui diagnosi richiede opportune indagini).&nbsp; </p>
<p>&nbsp;</p>
""";

class UsefulInformationIICBScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MealState>(
        converter: (store) => store.state.meal,
        builder: (context, mealState) {
          return HtmlScaffold(
            title: "IICB",
            html: htmlData,
          );
        });
  }
}
