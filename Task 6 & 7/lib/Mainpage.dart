import 'package:flutter/material.dart';

class Mainpage extends StatelessWidget {
  const Mainpage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Center(
            child: Text(
              "Bytewise Community",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Arial"),
            )),
      ),
      body: const Center(
        child: const Text(
          "Welcome To Bytewise Community",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),


      ),

    );
  }
}
