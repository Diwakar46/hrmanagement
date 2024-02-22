import 'package:flutter/material.dart';

class CustomFormFeild extends StatelessWidget {
  final String? label_Text;
  final Icon? icon;
  final Icon? icon_label;
  final Color bordersidecolor;
  final String? hint_text;
  final bool obscureText;
  final Icon? suffixIcon;
  final TextEditingController controller;
  //final int? max_length;
  double o_border_radius;
  double form_width;
  double form_height;

  CustomFormFeild({
    super.key,
    this.label_Text,
    //required this.max_length,
    this.hint_text,
    this.form_height = 200,
    this.form_width = 500,
    this.icon,
    this.icon_label,
    this.o_border_radius = 5,
    required this.obscureText,
    required this.bordersidecolor,
    this.suffixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //chaning the width of the form
      width: form_width,
      child: Column(
        children: [
          TextFormField(
            //maxLength: max_length,
            controller: controller,
            obscureText: obscureText,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                hintText: hint_text,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: bordersidecolor,
                  ),
                  borderRadius: BorderRadius.circular(o_border_radius),
                ),
                labelText: label_Text,
                label: icon_label,
                icon: icon,
                suffixIcon: suffixIcon,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(o_border_radius))),
          ),
        ],
      ),
    );
  }
}
