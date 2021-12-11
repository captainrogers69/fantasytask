import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fantasytask/pages/signup.dart';
import 'package:fantasytask/widgets/textfields.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
   //bool hidepassword= true;
    return Scaffold(
      body: Stack(children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height / 8,
              ),
              CircleAvatar(
                radius: 60.0,
                child: Icon(Icons.account_circle, size: 90),
                backgroundColor: Colors.deepPurple,
              ),
              SizedBox(
                height: size.height / 35,
              ),
              Column(
                children: const [
                  Text(
                    "Log in",
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: TextFieldswidget(
                  secureText: false,
                  controller: emailController,
                  hintText: "Enter Your Email",
                  helperText: "",
                ),
              ),
              const SizedBox(height: 5.0),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: TextFieldswidget(
                    secureText: true,
                    controller: passwordController,
                    hintText: "Enter Your Password",
                    helperText: "",
                  )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                onPressed: () {},
                child: Text("Login"),
              ),
              SizedBox(
                height: size.height / 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.black
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign up",
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
      ]),
    );
  }
//   void _togglePasswordView(){
//   hidepassword = !hidepassword;
//   setState(() {});
// }
}
