import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talkitout/components/signup_avatar.dart';
import 'package:talkitout/locallysaveddata/shared_prefs.dart';
import 'package:talkitout/routes/routes.dart';
import 'package:talkitout/static/form_decoration.dart';
import 'package:talkitout/validator/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var dbref = FirebaseFirestore.instance.collection('UserData');
  final number = TextEditingController();
  final password = TextEditingController();
  bool wait = false;
  var name, address, pwd, anonymousName, id, avatar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WELCOME'),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: const Icon(
                  Icons.speaker,
                  color: Colors.purple,
                  size: 90,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: number,
                          validator: (value) => validateEmail(value),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: formdecoration(
                              hint: '9819191919', label: 'Your number'),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          controller: password,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => validatePassword(value),
                          obscuringCharacter: '*',
                          obscureText: true,
                          decoration:
                              formdecoration(hint: '******', label: 'Password'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
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
                      login();
                    }
                  },
                  child: wait
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'LogIn',
                          style: TextStyle(fontSize: 19),
                        ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SignUpAvatar(
                      backgroundColor: Colors.white,
                      avatarIcon: Icons.facebook_outlined,
                      iconColor: Colors.blue,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteManager.signUpPage);
                      },
                      child: SignUpAvatar(
                        backgroundColor: Colors.white,
                        avatarIcon: Icons.person_add_alt_1_rounded,
                        iconColor: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    setState(() {
      wait = true;
    });
    await dbref
        .where('number', isEqualTo: number.text)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) async {
        if (element.exists) {
          //start here
          name = element['name'];
          id = element.id;
          pwd = element['password'];
          address = element['address'];
          anonymousName = element['anonymousName'];
          avatar = element['avatar'];
          if (password.text == pwd) {
            await sharedpref.savedata('name', name);
            await sharedpref.savedata('id', id);
            await sharedpref.savedata('address', address);
            await sharedpref.savedata('anonymousName', anonymousName);
            await sharedpref.savedata('avatar', avatar);
            setState(() {
              wait = false;
            });
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushReplacementNamed(
                context, RouteManager.mainLayoutPage);
          } else if (password.text != pwd) {
            setState(() {
              wait = false;
            });
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              elevation: 20,
              content: Text(
                'Enter valid Username & Password',
                style: TextStyle(color: Colors.red),
              ),
              backgroundColor: Colors.white,
            ));
          }
        }
      });
    });
  }
}
