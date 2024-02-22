import 'package:flutter/material.dart';
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
          child: FutureBuilder<List<Map<String, dynamic>>>(
              future: DatabaseHelper.getItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                } else {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    var userData = snapshot.data!.first;
                    var firstName = '${userData['firstName']}   ';
                    var fullName =
                        '${userData['firstName']} ${userData['lastName']}';
                    var role = '${userData['role']}';
                    var email = '${userData['email']}';
                    return Column(
                      children: [
                        AppBar(
                            leading: const Icon(Icons.menu),
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
                                  Navigator.pop(
                                      context); // Close the drawer page
                                },
                              )
                            ]),
                        Container(
                            //this padding helps for Circular avatar where it wanted to
                            margin: const EdgeInsets.only(bottom: 50),
                            child: const Align(
                              alignment: Alignment.topCenter,
                              child: CircleAvatar(
                                radius: 90,
                              ),
                            )),
                        RichText(
                            text: TextSpan(
                                text: //the name from the database,'
                                    firstName,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30))),
                        SizedBox.square(
                          child: Text('Role: $role'),
                        ),
                        const SizedBox(height: 16),
                        Card(
                          color: MyColors.kscaffold,
                          elevation: 10,
                          child: const ListTile(
                            title: Text('Basic Information'),
                            splashColor: Colors.grey,
                            leading: Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(height: 5),
                        ListTile(
                          onTap: () {},
                          title: const Text(
                            'Full Name',
                            style: TextStyle(fontSize: 13),
                          ),
                          subtitle: Text(
                            fullName,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ), //name should be fetched from the api
                          splashColor: Colors.grey,
                          trailing: const Icon(Icons.edit),
                        ),
                        const SizedBox(height: 5),
                        ListTile(
                          onTap: () {},
                          title: const Text(
                            'Email',
                            style: TextStyle(fontSize: 13),
                          ),
                          subtitle: Text(
                            email,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ), //name should be fetched from the api
                          leading: const Icon(Icons.email),
                          splashColor: Colors.grey,
                          trailing: const Icon(Icons.edit),
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
                          trailing: const Icon(Icons.edit),
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
                          leading: const Icon(Icons.phone),
                          splashColor: Colors.grey,
                          trailing: const Icon(Icons.edit),
                        ),
                        const SizedBox(height: 5),
                      ],
                    );
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      color: MyColors.kblack,
                    ));
                  }
                }
              }),
        ),
      ),
    );
  }
}
