import 'package:flutter/material.dart';

import '../static/form_decoration.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignUp')),
      body: Form(
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
                decoration: formdecoration(hint: '982121212', label: 'Number'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                decoration: formdecoration(hint: 'Texas,NY', label: 'Address'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
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
                decoration:
                    formdecoration(hint: 'Black hat', label: 'Anonymous Name'),
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
                onPressed: () {},
                child: Text(
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
}
