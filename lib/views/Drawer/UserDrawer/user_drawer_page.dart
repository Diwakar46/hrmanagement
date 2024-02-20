import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDrawer extends Drawer {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppBar(
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
                      Get.back(); // Close the drawer page
                    },
                  )
                ]),
            const SizedBox(height: 16),
            ListTile(
              onTap: () => Navigator.popAndPushNamed(context, '/calenderPage'),
              title: const Text('Calendar'),
              splashColor: Colors.grey,
              leading: const Icon(Icons.calendar_view_day_rounded),
            ),
            const SizedBox(height: 5),
            ListTile(
              onTap: () {},
              title: const Text('Theme'),
              splashColor: Colors.grey,
              leading: const Icon(Icons.window_outlined),
            ),
            const SizedBox(height: 5),
            const ListTile(
              title: Text('Settings'),
              splashColor: Colors.grey,
              leading: Icon(Icons.settings),
            ),
            const SizedBox(height: 5),
            const ListTile(
              title: Text('About'),
              splashColor: Colors.blue,
              leading: Icon(Icons.error_outline),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
