// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:catlog/pages/homepage.dart';
import 'package:flutter/material.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  String name = '';
  bool isbutton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("images/loginlogo.png"),
            Text(
              "Welcome $name",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w300),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                      labelText: "Your Name",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      labelText: "Your Password",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  isbutton = true;
                });
                await Future.delayed(
                  Duration(seconds: 2),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => MyHomePage()),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                height: 50,
                width: isbutton ? 50 : 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(isbutton ? 25 : 5),
                    color: Colors.deepPurple),
                child: isbutton
                    ? Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
