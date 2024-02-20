import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmanagement/constants/constants.dart';
import 'package:hrmanagement/views/HomePage/AdminHomePage/admin_home_page.dart';
import 'package:hrmanagement/views/HomePage/UserHomePage/user_home_page.dart';
import 'package:hrmanagement/views/Login/login.dart';
import 'package:hrmanagement/views/Register/register.dart';

void main() => runApp(GetMaterialApp(
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/adminhomepage': (context) => AdminHome(),
        '/userhomepage': (context) => UserHome(),
      },
      theme: ThemeData(
        primaryColor: MyColors.kprimary,
        focusColor: MyColors.kprimary,
        splashColor: MyColors.kwhite,
        dividerColor: Colors.transparent,
        // colorScheme: ColorScheme(
        //     brightness: Brightness.dark,
        //     primary: MyColors.kprimary,
        //     onPrimary: MyColors.kprimary,
        //     secondary: MyColors.ksecondary,
        //     onSecondary: MyColors.ksecondary,
        //     error: MyColors.kerror,
        //     onError: MyColors.kerror,
        //     background: MyColors.kprimary,
        //     onBackground: MyColors.kprimary,
        //     surface: MyColors.kprimary, //appbar ko theme to default
        //     onSurface: MyColors.kblack),
      ),
      debugShowCheckedModeBanner: false,
      home: AdminHome(),
    ));
