import 'package:flutter/material.dart';

class Combobox {
  List<String>? elements; // Valeurs : ["gélule", "sirop", "pommade"]
  Color? colorText;
  Color? colorBordure;
  Color? colorInterne;
  Function f;
  double large;
  double long;
  double elevation;
  var valeurPropre = [];
  String? selectedValue;
  String textDefaut;

  Combobox({
    this.elements,
    this.colorBordure,
    this.colorInterne = Colors.white,
    this.selectedValue,
    this.long = 150,
    this.large = 45,
    this.elevation = 2,
    this.textDefaut="Sélectionnez une valeur",
    required this.f,
  });

  Widget lancer({int i = 0}) {
    List<String> displayElements = [...?elements];

    return Container(
      height: large,
      width: long,
      decoration: BoxDecoration(
        color: this.colorInterne,
        border: Border.all(color: colorBordure ?? Colors.grey),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(this.elevation, this.elevation),
            blurRadius: this.elevation * 2,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 7),
        child: DropdownButton<String>(
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down, color: Color.fromRGBO(50, 190, 166, 1)),
          underline: Container(height: 0),
          hint: Text(
            textDefaut,
            style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          value: displayElements.contains(selectedValue) ? selectedValue : null,
          items: displayElements.map((String itm) {
            return DropdownMenuItem<String>(
              value: itm,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  itm,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (String? value) {
            if (value == null) return;

            selectedValue = value;
            valeurPropre = [value, elements?.indexOf(value)];
            f(value, elements?.indexOf(value));
          },
        ),
      ),
    );
  }
}
