import 'package:flutter/material.dart';

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
    );
  }
}
