import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.label = "Label",
    required Null Function() onPressed,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 150,
      child: ElevatedButton(
        onPressed: () {}, // pass the onPressed callback here
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ))),
        child: Text(
          label,
          style: const TextStyle(fontFamily: 'CADTMonoDisplay'),
        ),
      ),
    );
  }
}
