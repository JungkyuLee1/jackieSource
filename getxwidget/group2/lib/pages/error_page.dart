import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage(
      {this.title = 'Error',
      this.message = 'Something went wrong',
      required this.onPressed,
      Key? key})
      : super(key: key);

  final String? title;
  final String? message;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.red,
              size: 150,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              title!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 2,
            ),
            ElevatedButton(onPressed: onPressed, child: Text('Retry')),
          ],
        ),
      ),
    );
  }
}
