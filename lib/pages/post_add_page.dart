import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talkitout/pages/locallysaveddata/shared_prefs.dart';
import 'package:talkitout/static/form_decoration.dart';
import 'package:talkitout/validator/validator.dart';

class PostAddPage extends StatefulWidget {
  const PostAddPage({super.key});

  @override
  State<PostAddPage> createState() => _PostAddPageState();
}

class _PostAddPageState extends State<PostAddPage> {
  final postData = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var dbref = FirebaseFirestore.instance.collection('PostData');
  bool wait = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post')),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: TextFormField(
                controller: postData,
                validator: (value) => namevalidator(value),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                decoration:
                    formdecoration(hint: 'What\'s on your mind?', label: null),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Container(
            alignment: Alignment.topRight,
            height: MediaQuery.of(context).size.height * 0.07,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton.icon(
              icon: Icon(Icons.post_add_rounded),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  addPost();
                }
              },
              label: wait
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      'Add Post',
                      style: TextStyle(fontSize: 19),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void addPost() async {
    setState(() {
      wait = true;
    });
    var id, name, anonymousName, address;
    id = await sharedpref.getdata('id');
    name = await sharedpref.getdata('name');
    anonymousName = await sharedpref.getdata('anonymousName');
    address = await sharedpref.getdata('address');

    Map<String, dynamic> postingData = {
      'posterId': id.toString(),
      'postername': name.toString(),
      'anonymousName': anonymousName.toString(),
      'posterAddress': address.toString(),
      'post': postData.text.toString()
    };
    await dbref.add(postingData);
    setState(() {
      wait = false;
      postData.clear();
    });
  }
}
