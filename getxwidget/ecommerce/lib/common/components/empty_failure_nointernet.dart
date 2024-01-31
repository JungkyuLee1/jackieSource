import 'package:ecommerce/common/components/rounded_button_type_one.dart';
import 'package:flutter/material.dart';

class EmptyFailureNoInternet extends StatelessWidget {
  const EmptyFailureNoInternet(
      {required this.image,
      required this.title,
      required this.description,
      required this.buttonText,
      required this.onTap,
      required this.isButtonVisible,
      Key? key})
      : super(key: key);

  final String title, description, buttonText, image;
  final bool isButtonVisible;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(image, height: 250, width: 250),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.titleMedium!,
              ),
              SizedBox(
                height: 8,
              ),
              Offstage(
                offstage: isButtonVisible ? false : true,
                child: RoundedButtonTypeOne(
                  onTap: onTap,
                  buttonText: buttonText,
                  width: 150,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
