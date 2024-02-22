import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmanagement/constants/constants.dart';
import 'package:hrmanagement/views/HomePage/AdminHomePage/Employess/employee_controller.dart';

class Employess extends StatelessWidget {
  final EmployeeController employeeController = Get.put(EmployeeController());

  Employess({super.key});

  @override
  Widget build(BuildContext context) {
    employeeController.showTextFunction();

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => employeeController.showText.value
              ? Card(
                  color: MyColors.kprimary,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Register New employess',
                      style: TextStyle(color: MyColors.kwhite, fontSize: 12),
                    ),
                  ),
                )
              : const Text('')),
          IconButton(
            onPressed: () {
              Get.toNamed('/register');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
