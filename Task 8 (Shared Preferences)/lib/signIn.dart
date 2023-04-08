import 'package:bootcampflutter/Splash_Screen.dart';
import 'package:bootcampflutter/logIn.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  final _formKey = GlobalKey<FormState>();

  final _firstController = TextEditingController();
  final _secondController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _saveData() async {

    final prefs = await SharedPreferences.getInstance();
    final first = _firstController.text;
    final second = _secondController.text;
    final login = _loginController.text;
    final password = _passwordController.text;
    await prefs.setString('first', first);
    await prefs.setString('second', second);
    await prefs.setString('login', login);
    await prefs.setString('password', password);
  }

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Bytewise Sign Up",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Arial"),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Tap1(context);
                  },
                  child: Image.asset(
                    'assets/my_image.jpg',
                    height: 100,
                  ),
                ),
              ),
                textfield1(
                hintText: "First Name",
                controller: _firstController,
              ),
                textfield1(
                hintText: "Last Name",
                controller: _secondController,
              ),
               textfield1(
                hintText: "Enter Your Email Address",
                controller: _loginController,
              ),
               textfield1(
                hintText: "Enter Your Password",
                controller: _passwordController,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: ()  async {
                    if (true) {
                      await _saveData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => secondscreen()),
                      );
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(200, 50),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const secondscreen()));
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
                    "Login",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class textfield1 extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;

  const textfield1({Key? key, required this.hintText, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }
}
