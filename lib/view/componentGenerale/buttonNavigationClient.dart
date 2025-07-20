import 'package:flutter/material.dart';
import '../../controlers/espacePharmacie/controlerVente.dart';
import '../../controlers/espacePharmacie/controler_panier.dart';
import '../../session/Session.dart';
import 'optionButtonNavigation.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class ButtonNavigationClient {
  List<List<dynamic>> modelClient=[
    ["Reservation", "images/logoArgentNoSelect.png",(){}],
    ["Notification", "images/Alerte.png",(){}],
    ["Profil", "images/Personne2.png",(){}]
  ];

  List<List<dynamic>> modelPharmacie=[
    ["Vendre", "images/logoArgent.png",(c){
      Controler_panier(c).ajouterAuPanier();
    }],

    ["Panier", "images/logoPnier.png",(c){
      Controler_panier(c).voirPanier();
    },Session.increPanier],


    ["Vente", "images/logo voir.png",(c){
      ControlerVent(c).voirVenteJour();
    }],
    ["Notification", "images/Alerte.png",(v){
    print("hzello");
     // FlutterRingtonePlayer.stop();
    }]
  ];

  List<List<dynamic>> modelClient2=[

    ["Reservation", "images/logoArgentNoSelect.png",(){}],
    ["Panier", "images/logoPnier.png",(c){},Session.increPanier],
    ["Notification", "images/Alerte.png",(){}],
    ["Profil", "images/Personne2.png",(){}]
  ];

  
  var context;
  int model=1;

  ButtonNavigationClient({this.context,this.model=0} );

  traitement(){
    List<List<dynamic>> element=[];
    if(model==0){
      element=this.modelClient;
    }else if(model==1){
      element=this.modelPharmacie;

    }else{
      element=this.modelClient2;
    }

    List<Widget> elementRec=[];
    for(int i=0; i<element.length; i++){
      if(i==1 ||(i==2 && model==3)|| i==3){
        elementRec.add(OptionNavigation(valeur:Session.increPanier.toString(),panier:"1",element[i][0],element[i][1]).creerOption(action: (){
          element[i][2](context);
        },context:context));
      }
      else{
        elementRec.add(OptionNavigation(valeur:"0",panier:"0",element[i][0],element[i][1]).creerOption(action: (){
          element[i][2](context);
        },context:context));

      }

    }
    return elementRec;
  }

  Container afficheBlock (double LongeurDefaut){
    return Container(
      width: LongeurDefaut,
      height: 82,
      child:
      Column(
        children: [
          Container(
            color:  Color.fromRGBO(50, 190, 166, 1),
            width:LongeurDefaut ,
            height: 10,
          ),
       Container(

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:  traitement(),
    ) ,
    )
        ],
      ),

    );

  }






}

