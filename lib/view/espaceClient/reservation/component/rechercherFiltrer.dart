
import 'package:flutter/material.dart';
import 'package:pharmao/view/componentGenerale/Combobox.dart';

import '../../../componentGenerale/InputCostom.dart';





class VisibiliteContainer extends StatefulWidget {
  final bool isVisible;
  Function f;

  VisibiliteContainer({required this.isVisible,required this.f});

  @override
  State<VisibiliteContainer> createState() => visibiliteContainerState(this.f);
}

class visibiliteContainerState extends State<VisibiliteContainer> {
  Function f;

  visibiliteContainerState(this.f);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: Container(
        margin: EdgeInsets.only(top: 5),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InputCostom(Name:"rech",long: 150,lar:32,elevation: 2,
              value: "filtrer"
            ).lancer(),
          Combobox(large:32,elements: ["ville","commune"],f: (){
          },colorInterne: Colors.white,colorBordure: Colors.white
          ).lancer(),
          ],
        ),
      ),
    );
  }
}