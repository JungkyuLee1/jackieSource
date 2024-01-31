import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:group7_scrollbar/data/model/country.dart';

class AutocompleteController extends GetxController{

  late List<Country> countryNames;
  var noFocusNode=FocusNode().obs;


  @override
  void onInit() {
    super.onInit();
    countryNames=<Country>[
      Country(name: 'Not Select'),
      Country(name: 'India'),
      Country(name: "Australia"),
      Country(name: "Srilanka"),
      Country(name: "Africa"),
      Country(name: "Afghanistan"),
      Country(name: "Albania"),
      Country(name: "Algeria"),
      Country(name: "Andorra"),
      Country(name: "Korea"),
      Country(name: "Indonesia"),
    ];
  }
}