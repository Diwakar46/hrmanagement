import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget button_text;

  final VoidCallback? onPressed;
  Color ovelay_color;
  Color button_Color;
  double button_border_o_radius;
  double width;
  double height;

  CustomElevatedButton(
      {super.key,
      this.button_border_o_radius = 5,
      required this.button_text,
      this.onPressed,
      this.button_Color = Colors.green,
      this.ovelay_color = Colors.green,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: width,
      height: height,
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
                child: button_text,
              ),
            )),
      ),
    );
  }
}
