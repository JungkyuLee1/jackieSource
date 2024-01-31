import 'package:flutter/material.dart';
import 'package:getx_template/components/rounded_button_type_one.dart';

class EmptyFailureNoInternetView extends StatelessWidget {
  const EmptyFailureNoInternetView(
      {required this.image,
      required this.title,
      required this.description,
      required this.buttonText,
      required this.onTap,
      Key? key})
      : super(key: key);

  final String image;
  final String title;
  final String description;
  final String buttonText;
  final Function() onTap;


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset(image, fit: BoxFit.cover,),
                ),
                SizedBox(height: 20,),
                Text(title, style: TextStyle(fontSize: 16),),
                SizedBox(height: 4,),
                Text(description, style: TextStyle(fontSize: 14),),
                SizedBox(height: 20,),
                RoundedButtonTypeOne(width: 200, onTap: onTap, buttonText: buttonText),
              ],
            ),
          ),
        ),
      );
  }
}

// EmptyFailureNoInternetView(
//    image: 'assets/nodata.jpeg',
//    title: 'Error',
//    description: 'No data found',
//    buttonText: 'Retry',
//    onTap: () {
//    controller.getTvShow('1');
// },
// )
