import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmanagement/constants/constants.dart';
import 'package:hrmanagement/Widgets/custom_button.dart';
import 'package:hrmanagement/Widgets/custom_form.dart';
import 'package:hrmanagement/views/Login/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final LoginController _loginObj = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      //Single Child Scrool view to avoid feild Khole xi Register button also seen
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 80, 30, 40),
          child: Container(
            color: MyColors.kwhite,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: MyColors.kprimary,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomFormFeild(
                      obscureText: false,
                      label_Text: 'Email ',
                      hint_text: ' Enter Email Address ',
                      bordersidecolor: Colors.grey.shade300,
                      controller: _email),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomFormFeild(
                      label_Text: 'Password',
                      hint_text: ' Enter Password',
                      obscureText: false,
                      bordersidecolor: Colors.black,
                      controller: _password),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomElevatedButton(
                    button_text: 'Login',
                    ovelay_color: Colors.grey,
                    button_text_Color: Colors.white,
                    onPressed: () =>
                        _loginObj.login(_email.text, _password.text),
                  ),
                  const SizedBox(
                    height: 150,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
