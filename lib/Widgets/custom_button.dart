import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String button_text;

  final Color? button_text_Color;
  final VoidCallback? onPressed;
  Color ovelay_color;
  Color button_Color;
  double button_border_o_radius;

  CustomElevatedButton(
      {super.key,
      this.button_border_o_radius = 5,
      required this.button_text,
      this.onPressed,
      this.button_Color = Colors.green,
      this.button_text_Color,
      this.ovelay_color = Colors.green});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: double.infinity,
      height: 60,
      child: InkWell(
        splashColor: ovelay_color,
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor: MaterialStatePropertyAll<Color>(button_Color),
              overlayColor: MaterialStatePropertyAll<Color>(ovelay_color),
            ),
            onPressed: onPressed,
            child: SizedBox(
              height: 45,
              width: 60,
              child: Center(
                child: Text(
                  button_text,
                  style: TextStyle(color: button_text_Color),
                ),
              ),
            )),
      ),
    );
  }
}
