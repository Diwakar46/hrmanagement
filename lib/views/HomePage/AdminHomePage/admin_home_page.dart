import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmanagement/Database/database.dart';
import 'package:hrmanagement/constants/constants.dart';
import 'package:hrmanagement/views/Drawer/AdminDrawer/admin_drawer_page.dart';
import 'package:hrmanagement/views/HomePage/AdminHomePage/Employess/employess.dart';
import 'package:hrmanagement/views/HomePage/AdminHomePage/admin_controller.dart';
import 'package:hrmanagement/views/HomePage/home_controller.dart';
import 'package:hrmanagement/views/Login/login.dart';
import 'package:hrmanagement/views/Register/register.dart';

class AdminHome extends StatelessWidget {
  AdminHome({super.key});
  final HomeController homeControllerObj = Get.put(HomeController());
  final AdminController adminController = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //this is used for changing theme of the app
      theme:
          homeControllerObj.isOff.value ? ThemeData.dark() : ThemeData.light(),
      home: Material(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
              drawer: const AdminDrawer(),
              appBar: AppBar(
                bottom: TabBar(
                    labelColor: MyColors.kprimary,
                    indicatorColor: MyColors.kprimary,
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.home),
                        text: 'Home',
                      ),
                      Tab(
                        icon: Icon(Icons.note),
                        text: 'Home',
                      ),
                      Tab(
                        icon: Icon(Icons.abc_outlined),
                        text: 'Home',
                      ),
                      Tab(
                        icon: Icon(Icons.supervised_user_circle),
                        text: 'Employees',
                      ),
                    ]),
                actions: [
                  (homeControllerObj.isOff.value)
                      ? const Icon(
                          Icons.dark_mode_outlined,
                          color: Colors.yellow,
                        )
                      : const Icon(
                          Icons.sunny,
                          color: Colors.amber,
                        ),
                  Switch(
                      activeColor: MyColors.kwhite,
                      inactiveThumbColor: MyColors.kblack,
                      value: homeControllerObj.isOff.value,
                      onChanged: (value) {
                        homeControllerObj.toogleTheme(value);
                      }),
                  IconButton(
                      onPressed: () async {
                        var list = await DatabaseHelper.getItems();
                        var listE = await DatabaseHelper.getToken();
                        
                        print(list);
                        print(listE);
                      },
                      icon: const Icon(Icons.notifications_active)),
                  IconButton(
                      onPressed: () {
                        adminController.logout();
                      },
                      icon: const Icon(Icons.logout_outlined)),
                ],
              ),
              body: TabBarView(
                children: [
                  LoginPage(),
                  RegisterPage(),
                  RegisterPage(),
                  Employess()
                ],
              )),
        ),
      ),
    );
  }
}
