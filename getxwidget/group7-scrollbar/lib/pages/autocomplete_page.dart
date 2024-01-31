import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/autocomplete_controller.dart';
import 'package:group7_scrollbar/data/model/country.dart';

class AutocompletePage extends GetView<AutocompleteController> {
  const AutocompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Autocomplete'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Autocomplete(
            optionsBuilder: (textEditingValue) {
              return controller.countryNames
                  .where((Country country) => country.name
                      .toLowerCase()
                      .startsWith(textEditingValue.text.toLowerCase()))
                  .toList();
            },
            displayStringForOption: (Country country) => country.name,
            fieldViewBuilder: (BuildContext context,
                TextEditingController fieldTextEditingController,
                FocusNode fieldFocusNode,
                Function() onFieldSubmitted) {
              return TextField(
                controller: fieldTextEditingController,
                focusNode: fieldFocusNode,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Select Country'),
              );
            },
            onSelected: (Country selection) {
              print('Country : ${selection.name}');

              if (selection.name == 'Not Select') {
                print('Please select country');
              }
              FocusManager.instance.primaryFocus?.unfocus();
            },

            //Data 보여주는 하단 Design 목적(옵션)
            // optionsViewBuilder: (BuildContext context,
            //     AutocompleteOnSelected<Country> onSelected,
            //     Iterable<Country> country) {
            //   return Material(
            //     child: Container(
            //       width: 330,
            //       color: Colors.deepPurpleAccent,
            //       child: ListView.builder(
            //               itemCount: country.length,
            //               itemBuilder: (context, index) {
            //                 final Country option = country.elementAt(index);
            //
            //                 return GestureDetector(
            //                   onTap: (){
            //                     onSelected(option);
            //                   },
            //                   child: ListTile(
            //                     title: Text(
            //                       option.name,
            //                       style: TextStyle(color: Colors.white),
            //                     ),
            //                   ),
            //                 );
            //               }),
            //
            //     ),
            //   );
            // },
          ),
        ));
  }
}
