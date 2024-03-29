import 'package:flutter/material.dart';

class CommonFloatingActionButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const CommonFloatingActionButton(
      {Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        // alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(0),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          )),
    );
  }
}