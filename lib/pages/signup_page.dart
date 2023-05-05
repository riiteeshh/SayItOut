import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talkitout/validator/validator.dart';

import '../routes/routes.dart';
import '../static/form_decoration.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final name = TextEditingController();
  final nickname = TextEditingController();
  final address = TextEditingController();
  final number = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var dbref = FirebaseFirestore.instance.collection('UserData');
  bool wait = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignUp')),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    validator: (value) => namevalidator(value),
                    controller: name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration:
                        formdecoration(hint: 'John Mayer', label: 'Full-Name'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => validateNumber(value),
                    decoration:
                        formdecoration(hint: '982121212', label: 'Number'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: address,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => namevalidator(value),
                    decoration:
                        formdecoration(hint: 'Texas,NY', label: 'Address'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: email,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => validateEmail(value),
                    decoration: formdecoration(
                        hint: 'john mayer @abc.com', label: 'E-mail address'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: password,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => validatePassword(value),
                    obscuringCharacter: '*',
                    obscureText: true,
                    decoration: formdecoration(hint: '***', label: 'Password'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: nickname,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => namevalidator(value),
                    decoration: formdecoration(
                        hint: 'Black hat', label: 'Anonymous Name'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.065,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        uploadData();
                      }
                    },
                    child: wait
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'SignUp',
                            style: TextStyle(fontSize: 19),
                          ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void uploadData() async {
    setState(() {
      wait = true;
    });
    Map<String, dynamic> users = {
      'name': name.text.toUpperCase(),
      'number': number.text,
      'address': address.text.toUpperCase(),
      'emailAddress': email.text.toUpperCase(),
      'password': password.text.toUpperCase(),
      'anonymousName': nickname.text.toUpperCase(),
      'avatar':
          'https://firebasestorage.googleapis.com/v0/b/sayitout-f2ee2.appspot.com/o/dpimage2.png?alt=media&token=39e1bd27-0192-4fe2-9395-e567498e51ad'
    };
    await dbref.add(users);
    setState(() {
      wait = false;
    });
    Navigator.pop(context);
  }
}
