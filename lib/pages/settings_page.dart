import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talkitout/locallysaveddata/shared_prefs.dart';

import '../components/settings_listtiles.dart';
import '../routes/routes.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var name, anonymousName, avatar, id;
  Future<dynamic> getData() async {
    id = await sharedpref.getdata('id');
    name = await sharedpref.getdata('name');
    anonymousName = await sharedpref.getdata('anonymousName');
    avatar = await sharedpref.getdata('avatar');
    return [name, anonymousName];
  }

  final dbref = FirebaseFirestore.instance.collection('UserData');

  List Avatar = [
    'https://firebasestorage.googleapis.com/v0/b/sayitout-f2ee2.appspot.com/o/dpimage2.png?alt=media&token=39e1bd27-0192-4fe2-9395-e567498e51ad',
    'https://firebasestorage.googleapis.com/v0/b/sayitout-f2ee2.appspot.com/o/dpimage3.png?alt=media&token=7314b54d-c091-41de-a1b5-fcf3ba7e2c04',
    'https://firebasestorage.googleapis.com/v0/b/sayitout-f2ee2.appspot.com/o/dpimage1.png?alt=media&token=e3f2f6df-7efb-409d-b784-d240a2982a85',
    'https://firebasestorage.googleapis.com/v0/b/sayitout-f2ee2.appspot.com/o/dp4.png?alt=media&token=a329c61f-a3ba-4c0a-83f3-892cdf9a4983',
    'https://firebasestorage.googleapis.com/v0/b/sayitout-f2ee2.appspot.com/o/dp6.jpg?alt=media&token=90bd081c-b92d-4dcc-bb20-60873216941f',
    'https://firebasestorage.googleapis.com/v0/b/sayitout-f2ee2.appspot.com/o/dp5.png?alt=media&token=5a802485-7720-4da3-9035-5617893da065'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
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
                              margin: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
                              child: ClipOval(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: GestureDetector(
                                  onTap: () {
                                    chooseAvatar();
                                  },
                                  child: CircleAvatar(
                                    radius: 45,
                                    backgroundColor: Colors.purple,
                                    child: Image.network(
                                      avatar,
                                      fit: BoxFit.cover,
                                    ),
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
                                    name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    anonymousName,
                                    style: TextStyle(
                                        fontSize: 16,
                                        wordSpacing: 4,
                                        color: Colors.purple,
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
                      Navigator.pushReplacementNamed(
                          context, RouteManager.loginPage);
                    },
                    child: SettingsListTiles(
                        title: 'Log-Out',
                        subtitle: 'Log-out of the current account',
                        leading: Icons.logout_rounded),
                  )
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(color: Colors.purple),
            );
          }),
    );
  }

  void chooseAvatar() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return GridView.builder(
              itemCount: Avatar.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.3, crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  child: GestureDetector(
                    onTap: () async {
                      print(Avatar[index]);

                      await dbref.doc(id).update({'avatar': Avatar[index]});
                      sharedpref.savedata('avatar', Avatar[index]);
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 1,
                      backgroundColor: Colors.purple,
                      child: Image.network(
                        Avatar[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
