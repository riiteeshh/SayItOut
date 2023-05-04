import 'package:flutter/material.dart';

import '../components/settings_listtiles.dart';
import '../routes/routes.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            // color: Colors.red,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: ClipOval(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.purple,
                          child: Image.network(
                            'https://images-platform.99static.com//zA0n0YWqsSEq4b7S1wRKZWw1QU0=/0x271:2274x2545/fit-in/500x500/projects-files/113/11307/1130735/6d7f887d-54a1-451b-9b23-23edc9bd9b2e.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            'Ritesh Pandey',
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'Nepal',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 5,
          ),
          SettingsListTiles(
              title: 'Your Information',
              subtitle: 'Access your personal information',
              leading: Icons.face_2_rounded),
          SettingsListTiles(
              title: 'Password',
              subtitle: 'Change/Reset your password',
              leading: Icons.password_rounded),
          SettingsListTiles(
              title: 'Bio-metrics',
              subtitle: 'Set your bio-metric info',
              leading: Icons.fingerprint_rounded),
          GestureDetector(
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacementNamed(context, RouteManager.loginPage);
            },
            child: SettingsListTiles(
                title: 'Log-Out',
                subtitle: 'Log-out of the current account',
                leading: Icons.logout_rounded),
          )
        ],
      ),
    );
  }
}
