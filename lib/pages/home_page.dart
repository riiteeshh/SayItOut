import 'package:flutter/material.dart';
import 'package:talkitout/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> refreshed() async {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacementNamed(context, RouteManager.mainLayoutPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: RefreshIndicator(
        color: Colors.purple,
        strokeWidth: 1.7,
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
          return refreshed();
        },
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Card(
                      elevation: 0,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.purple,
                                        child: Image.network(
                                          'https://images-platform.99static.com//zA0n0YWqsSEq4b7S1wRKZWw1QU0=/0x271:2274x2545/fit-in/500x500/projects-files/113/11307/1130735/6d7f887d-54a1-451b-9b23-23edc9bd9b2e.png',
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                  Container(
                                    child: Text(
                                      'Ritesh Pandey',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
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
                              Container(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.report,
                                    color: Colors.red,
                                    size: 25,
                                  ),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Text(
                                'sadhkaslhdkashdaskdaskjdbasknjkkkkkkkkkkkkkk'
                                'jdbaskdbaskdjbaskjdbaskjdbassssssssssssssssssssssssss'),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              );
            }),
      ),
    );
  }
}
