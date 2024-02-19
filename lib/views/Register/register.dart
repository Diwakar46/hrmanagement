import 'package:flutter/material.dart';
import 'package:hrmanagement/constants/constants.dart';
import 'package:hrmanagement/Widgets/custom_button.dart';
import 'package:hrmanagement/Widgets/custom_form.dart';
import 'package:hrmanagement/views/Register/register_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController firstName = TextEditingController();
  final TextEditingController middleName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final RegisterController _registerObj = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      //Single Child Scrool view to avoid
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 80, 30, 40),
          // child: Container(
          //   color: MyColors.kwhite,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: MyColors.kprimary,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomFormFeild(
                    obscureText: false,
                    label_Text: 'FirstName ',
                    hint_text: 'Enter First Name',
                    bordersidecolor: Colors.grey.shade300,
                    controller: firstName),
                const SizedBox(
                  height: 15,
                ),
                CustomFormFeild(
                    label_Text: 'Middle Name',
                    hint_text: ' Enter Middle Name',
                    obscureText: false,
                    bordersidecolor: Colors.black,
                    controller: middleName),
                const SizedBox(
                  height: 15,
                ),
                CustomFormFeild(
                    label_Text: 'LastName',
                    hint_text: ' Enter Last Name',
                    obscureText: false,
                    bordersidecolor: Colors.black,
                    controller: lastName),
                const SizedBox(
                  height: 15,
                ),
                CustomFormFeild(
                    label_Text: 'Email',
                    hint_text: 'Enter Email Address',
                    obscureText: false,
                    bordersidecolor: Colors.black,
                    controller: email),
                const SizedBox(
                  height: 15,
                ),
                CustomElevatedButton(
                  button_text: 'Register',
                  ovelay_color: Colors.grey,
                  button_text_Color: Colors.white,
                  onPressed: () {
                    _registerObj.register(firstName.text, middleName.text,
                        lastName.text, email.text);
                  },
                ),
                const SizedBox(
                  height: 150,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
