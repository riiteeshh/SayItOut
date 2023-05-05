import 'package:flutter/material.dart';
import 'package:talkitout/static/form_decoration.dart';

class PostAddPage extends StatefulWidget {
  const PostAddPage({super.key});

  @override
  State<PostAddPage> createState() => _PostAddPageState();
}

class _PostAddPageState extends State<PostAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              decoration:
                  formdecoration(hint: 'What\'s on your mind?', label: null),
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
              onPressed: () {},
              label: Text(
                'Add Post',
                style: TextStyle(fontSize: 19),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
