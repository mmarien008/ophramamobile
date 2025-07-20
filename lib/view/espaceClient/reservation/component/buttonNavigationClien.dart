import 'package:flutter/material.dart';


import 'optionButtonNavigation.dart';


class ButtonNavigation {

  var context;

  ButtonNavigation( {this.context} ){

  }
  Container afficheBlock ( double LongeurDefaut){
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
          Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [OptionNavigation("Vendre", "images/logoArgent.png").creerOption(action: (){
                  //controllerMedicament(context).vendreMedicament();
                },context:context),
                  OptionNavigation("Panier", "images/logoPnier.png",panier: 1).creerOption(action: (){
                   // controllerMedicament(context).voirPanier();
                  },context:context),
                  OptionNavigation("Vente du jour", "images/logo voir.png").creerOption(action: (){
                    //controllerVente(context).voirLesVentes(context);
                  },context:context),
                  OptionNavigation("Profil", "images/Personne.png").creerOption(action: (){

                  },context:context)
                ],
              )
          )

        ],
      ),

    );

  }




}

