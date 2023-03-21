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
  //Animated Page Done
  final _formkey = GlobalKey<FormState>();

  movetoHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isbutton = true;
      });
      await Future.delayed(
        Duration(seconds: 2),
      );
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => MyHomePage()),
        ),
      );
      setState(() {
        isbutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " username can't be empty";
                        }
                        return null;
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " password can't be empty";
                        } else if (value.length < 6) {
                          return "passwrd length can't be less than 6";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => movetoHome(context),
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
      ),
    );
  }
}
