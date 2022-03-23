// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class addnote extends StatefulWidget {
  const addnote({Key? key}) : super(key: key);

  @override
  _addnoteState createState() => _addnoteState();
}

class _addnoteState extends State<addnote> {
  TextEditingController second = TextEditingController();

  TextEditingController third = TextEditingController();

  final fb = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    var rng = Random();
    var k = rng.nextInt(10000);

    final ref = fb.ref().child('todos/$k');

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add Todos")),
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: TextField(
                  controller: second,
                  decoration: InputDecoration(
                    hintText: 'Enter Title Here',
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: TextField(
                  controller: third,
                  decoration: InputDecoration(
                    hintText: 'Enter Sub title Here',
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              // color: Colors.indigo[900],
              onPressed: () {
                ref.set({
                  "title": second.text,
                  "subtitle": third.text,
                }).asStream();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              },
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
