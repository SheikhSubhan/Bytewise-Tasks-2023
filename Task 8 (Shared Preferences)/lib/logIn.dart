import 'package:bootcampflutter/welcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'signIn.dart';

class secondscreen extends StatefulWidget {
  const secondscreen ({Key? key}) : super(key: key);

  @override
  State<secondscreen> createState() => _secondscreenState();
}

class _secondscreenState extends State<secondscreen> {

  String? _first;
  String? _second;
  String? _login;
  String? _password;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _first = prefs.getString('first');
      _second = prefs.getString('second');
      _login = prefs.getString('login');
      _password = prefs.getString('password');
    });
  }
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white, 
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
              textfield1(
              hintText: "Enter Your Email Address",
              controller: _emailController,
            ),
              textfield1(
              hintText: "Enter Your Password",
                controller: _passwordController,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                   onPressed: () async {
                    final email = _emailController.text;
                    print(email);
                    final password = _passwordController.text;
                    print(password);
                    if (email == _login && password == _password) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Mainpage()));
                      print("object 1");
                    } else {
                      print("object");

                    }
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(200, 50),
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
                      const Size(200, 50),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.green,
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
