import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
            child: const Text(
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
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),),
          child: Image.asset('assets/my_image.jpg',height: 100,)),
            textfield1(
              hintText: "Enter Your Email Address",
            ),
            textfield1(
              hintText: "Enter Your Password",
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Sign In",
                    textAlign: TextAlign.center,
                  ),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      Size(200, 50), // Set the size of the button here
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class textfield1 extends StatelessWidget {
  final String hintText;

  const textfield1({Key? key, required this.hintText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }
}
