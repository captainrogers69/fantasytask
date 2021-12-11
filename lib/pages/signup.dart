import 'package:fantasytask/services/auth_services.dart';
import 'package:fantasytask/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:fantasytask/widgets/textfields.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final authProvider = useProvider(authencationServiceProvider);
    final isLoading = useState(false);

    return Scaffold(
      body: Stack(children: <Widget>[
        SingleChildScrollView(
          child: isLoading.value
              ? const Center(
                  child:  Center(child: CircularProgressIndicator()))
              : Column(
                  children: [
                    SizedBox(
                      height: size.height / 8,
                    ),
                    const CircleAvatar(
                      radius: 60.0,
                      backgroundColor: Colors.deepPurple,
                      child: Icon(Icons.account_circle, size: 90),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      children: const [
                        Text(
                          "Create Account",
                          style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
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
                      style:
                          ElevatedButton.styleFrom(primary: Colors.deepPurple),
                      onPressed: () async {
                        isLoading.value = true;
                        await authProvider
                            .signupWithEmail(
                                emailController.text, passwordController.text)
                            .onError((error, stackTrace) {
                          ErrorHandler.errorDialog(context, error);
                          isLoading.value = false;
                        });
                        isLoading.value = false;
                        Navigator.pop(context);
                      },
                      child: const Text("SignUp"),
                    ),
                    SizedBox(
                      height: size.height / 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const  Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.black),
                        ),
                      const  SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:const Text(
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
      ]),
    );
  }
}
