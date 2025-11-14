import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: _title(),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: _avatar(),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.black),
          padding: EdgeInsets.all(80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _postList(),
              _menu(),
            ],
          ),
        ));
  }

  Widget _title() {
    return Text("ProgrammerLife();");
  }

  Widget _avatar() {
    return CircleAvatar(
      backgroundImage: AssetImage("images/test.png"),
      radius: 16,
    );
  }

  Widget _postList() {
    return Column(
      children: [Text("All posts(10)")],
    );
  }

  Widget _menu() {
    return Column(
      children: [Text("All menu(10)")],
    );
  }
}
