import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmanagement/Database/database.dart';
import 'package:hrmanagement/constants/constants.dart';

class AdminDrawer extends Drawer {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: MyColors.kgreen,
      child: Container(
        decoration: BoxDecoration(gradient: MyColors.myGradient),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(builder: (context) {
            return Column(
              children: [
                AppBar(
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading:
                        false, // Hide the default back button
                    title: const Text(
                      'Profile',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context); // Close the drawer page
                        },
                      )
                    ]),
                Container(
                    //this padding helps for Circular avatar where it wanted to
                    margin: EdgeInsets.only(bottom: 50),
                    child: const Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        radius: 90,
                      ),
                    )),
                RichText(
                    text: const TextSpan(
                        text: //the name from the database,'
                            'ahfah',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w900,
                            fontSize: 30))),
                const SizedBox.square(
                  child: Text('Role: Admin'),
                ),
                const SizedBox(height: 16),
                Card(
                  color: MyColors.kscaffold,
                  elevation: 10,
                  child: ListTile(
                    onTap: () {},
                    title: const Text('Basic Information'),
                    splashColor: Colors.grey,
                    leading: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 5),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    'Full Name',
                    style: TextStyle(fontSize: 13),
                  ),
                  subtitle: const Text(
                    'Diwakar Dhamala ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ), //name should be fetched from the api
                  splashColor: Colors.grey,
                  trailing: Icon(Icons.edit),
                ),
                const SizedBox(height: 5),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    'Email',
                    style: TextStyle(fontSize: 13),
                  ),
                  subtitle: const Text(
                    'diwakar@gmail.com ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ), //name should be fetched from the api
                  leading: Icon(Icons.email),
                  splashColor: Colors.grey,
                  trailing: Icon(Icons.edit),
                ),
                const SizedBox(height: 5),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Text(
                    '⚥',
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {},
                  title: const Text(
                    'Gender',
                    style: TextStyle(fontSize: 13),
                  ),
                  subtitle: const Text(
                    'Male ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ), //name should be fetched from the api
                  splashColor: Colors.grey,
                  trailing: Icon(Icons.edit),
                ),
                const SizedBox(height: 5),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 13),
                  ),
                  subtitle: const Text(
                    '+977 9862964985 ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ), //name should be fetched from the api
                  leading: Icon(Icons.phone),
                  splashColor: Colors.grey,
                  trailing: Icon(Icons.edit),
                ),
                const SizedBox(height: 5),
              ],
            );
          }),
        ),
      ),
    );
  }
}
