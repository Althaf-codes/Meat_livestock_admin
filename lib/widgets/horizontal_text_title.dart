import 'package:flutter/material.dart';

class HorizontalTitleText extends StatelessWidget {
  String title;
  String text;
  HorizontalTitleText({Key? key, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$title   :   ",
            style: const TextStyle(
              color: Colors.green,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            )),
        Expanded(
          child: Text(text,
              style: const TextStyle(
                color: Color.fromARGB(255, 131, 130, 130),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    );
  }
}
