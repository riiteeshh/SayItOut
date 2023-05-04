import 'package:flutter/material.dart';
import 'package:talkitout/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteManager.loginPage,
      onGenerateRoute: RouteManager.generateRoute,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.purple,
        centerTitle: true,
      )),
      // home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              RouteManager.loginPage;
            },
            child: Image.network(
                'https://images-platform.99static.com/Ur3l7VUh8HeIC1ZA_7ceZR1F4dc=/500x500/top/smart/99designs-contests-attachments/8/8721/attachment_8721760'),
          ),
        ),
      )),
    );
  }
}
