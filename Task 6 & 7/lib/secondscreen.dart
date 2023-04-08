import 'package:bootcampflutter/Mainpage.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class secondscreen extends StatelessWidget {
  const secondscreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Center(
            child: Text(
          "Bytewise Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Arial"),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),),
          child: GestureDetector(
              onTap: () {
                Tap1(context);
              },
              child: Image.asset('assets/my_image.jpg',height: 100,))),
            const textfield1(
              hintText: "Enter Your Email Address",
            ),
            const textfield1(
              hintText: "Enter Your Password",
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(200, 50), // Set the size of the button here
                    ),
                  ),
                  child: const Text(
                    "Login",
                    textAlign: TextAlign.center,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(200, 50), // Set the size of the button here
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.green, // set the background color
                    ),
                  ),
                  child: const Text(
                    "Sign In",
                    textAlign: TextAlign.center,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
void Tap1(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const Mainpage()));
}
