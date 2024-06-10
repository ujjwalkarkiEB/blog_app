import 'package:flutter/material.dart';

class EmptyText extends StatelessWidget {
  const EmptyText({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(
        "assets/images/add/emptylist.png",
        height: 200,
        width: 200,
      ),
      RichText(
          text: TextSpan(children: [
        const TextSpan(
            text: 'Empty!  ',
            style: TextStyle(
                color: Colors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: title,
            style: const TextStyle(
                color: Colors.black38, decoration: TextDecoration.underline))
      ])),
    ]);
  }
}
