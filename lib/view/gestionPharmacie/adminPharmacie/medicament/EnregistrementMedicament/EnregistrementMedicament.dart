import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../controlers/espacePharmacie/admin/controler_medicament.dart';
import '../../../../componentGenerale/ButtonCostom.dart';
import '../../../../componentGenerale/Combobox.dart';
import '../../../../componentGenerale/InputCostom.dart';
import '../../../../componentGenerale/entete.dart';
import '../../../../componentGenerale/messageFlache.dart';
import '../../../../leyouts/base.dart';
import 'composant/BlockElement.dart';
import 'composant/IconEnr.dart';
import 'composant/LigneElement.dart';
import 'composant/TextEnr.dart';


class EnregistrementMedicament extends StatefulWidget {

  @override
  State<EnregistrementMedicament> createState() => EnregistrementMedicamentState();

}


class EnregistrementMedicamentState extends State<EnregistrementMedicament> {
  Color appBarColor = Color.fromRGBO(50, 190, 166, 1);
  var tampoProduit = [ "Comprimer","Injectable", "Cipo"];
  var dose =["mg","poids","ml"];
  var nomProduit="",doseMedoc="",prix="",unite="mg";
  String msg="";

  var selectedValueUnite;
  var selectedValueForm;



  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;

    InputCostom nomMedoc= InputCostom(Name:"nomMedoc" ,elevation:5,long: width-50,lar: 50,
        value: "Nom du produit"
    );
    InputCostom doseMedoc= InputCostom(Name:"doseMedoc",elevation:5,long: width-140,lar: 50,
        value: "Dose"
    );
    InputCostom prixMedoc= InputCostom(Name:"prixMedoc",elevation:5,long: width-140,lar: 50,
        value: "prix"
    );

    Combobox formeMedoc=  Combobox(
      textDefaut: "selectionner une forme",
      selectedValue: selectedValueForm,
        colorInterne: Colors.white,
        long: width-50,
        large: 50,
        elevation: 5
        ,
        elements:tampoProduit,
        colorBordure: Colors.white,
      f: (x,y){
        setState(() {
          selectedValueForm = x;
        });
      }
    );
    Combobox uniteMedoc=  Combobox(
        textDefaut: "unite",
      selectedValue: selectedValueUnite,
        colorInterne: Colors.white,
        long: width-280,
        large: 50,
        elevation: 5
        ,
        elements:this.dose,
        colorBordure: Colors.white,
      f:(x,y){

        setState(() {
          selectedValueUnite = x;
        });
      }
    );


    return Scaffold(

      appBar: Entete(
          flecheR: true,
          context: context,
          title: "",
          pageCible: (){
            Controler_medicament(context).voirStock();
          },
          text: "",
          logo: "images/Personne.png"
      ).Demarrer(),
      body: Base(
          content:
          BlockElement([
          LigneElement([
          nomMedoc.lancer()
        ]).lancer()
        ,
        LigneElement([
        formeMedoc.lancer()
        ]).lancer(),


        LigneElement([
       doseMedoc.lancer()
        ,
        uniteMedoc.lancer()
        ]).lancer(),

        LigneElement([
        prixMedoc.lancer(),
        TextEnr("Fc",width-280)
        ]).lancer(),

        ButtonCostom("Enregistrer",Color.fromRGBO(50, 190, 166, 1),()async{

          try {
            String message = await Controler_medicament(context).Enregistrer(
              nomMedoc.ValueAf(),
              formeMedoc.valeurPropre[0],
              prixMedoc.ValueAf(),
              doseMedoc.ValueAf(),
              uniteMedoc.valeurPropre[0],
            );

            showMyToast(message);
          } catch (e) {

            showMyToast("Tout les champs sont obligatoires",colorErreur: Colors.red);
          }



    },taille: 14,mt: 6).lancer(),

    ]).lancer()
          ,child: []
      ).lancer(400,MediaQuery.of(context).size.width-30),
    );

  }
}



void showMyToast(String message,{colorErreur=Colors.black}) {
  Fluttertoast.showToast(
    msg:message ,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM, // ou TOP, CENTER
    timeInSecForIosWeb: 2,
    backgroundColor: colorErreur,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}





