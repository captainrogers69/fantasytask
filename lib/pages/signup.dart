import 'package:flutter/material.dart';
import 'package:fantasytask/widgets/textfields.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                height: size.height / 8,
              ),
                    const CircleAvatar(
                      radius: 60.0,
                      backgroundColor: Colors.deepPurple,
                      child: Icon(Icons.account_circle, size: 90),
                    ),
                    const SizedBox(height: 20.0,),
                    Column(
                      children: const [
                        Text("Create Account",style: TextStyle(fontSize: 28.0,fontFamily: 'JosefinSans',fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextFieldswidget(
                        controller: usernameController,
                        secureText: false,
                        hintText: "Enter Your Name",
                        helperText: "",
                      )
                    ),
                    const SizedBox(height: 1.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextFieldswidget(
                        secureText: false,
                        controller: emailController,
                        hintText: "Enter Your Email",
                        helperText: "",
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextFieldswidget(
                        secureText: true,
                        controller: passwordController,
                        hintText: "Enter Your Password",
                        helperText: "",
                      ),
                    ),
                    ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                onPressed: () {},
                child: Text("SignUp"),
              ),
              SizedBox(
                height: size.height / 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.black
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.redAccent,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
                  ],
                ),
              )
        ]
      ),
    );
  }
}