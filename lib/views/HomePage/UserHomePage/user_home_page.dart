import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmanagement/constants/constants.dart';
import 'package:hrmanagement/views/Drawer/AdminDrawer/admin_drawer_page.dart';
import 'package:hrmanagement/views/HomePage/home_controller.dart';
import 'package:hrmanagement/views/Login/login.dart';
import 'package:hrmanagement/views/Register/register.dart';

class UserHome extends StatelessWidget {
  UserHome({super.key});
  final HomeController homeControllerObj = Get.put(HomeController());

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
                        icon: Icon(Icons.phone),
                        text: 'Home',
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
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_active)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.person_rounded)),
                ],
              ),
              body: TabBarView(
                children: [LoginPage(), RegisterPage()],
              )),
        ),
      ),
    );
  }
}
