import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:threads/routes/routenames.dart';
import 'package:threads/widgets/Authinput.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController password = TextEditingController(
    text: '',
  );
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController(
    text: '',
  );
  void submit(){
    if(formkey.currentState!.validate()){
      Get.snackbar('Success', 'Registration Successful');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Center(
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Image.asset('lib/assets/logo.png',
                      width: 80,
                      height: 80,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Login',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,

                          ),
                          ),
                          Text('Welcome Back')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Authinput(
                      validator:  ValidationBuilder(
                      ).minLength(3).maxLength(10).build(),
                        controller: email,
                        hintText: 'Enter Email/Username',
                        label: 'email',
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Authinput(
                      validator:  ValidationBuilder(
                      ).required().minLength(3).maxLength(10).build(),
                      controller: password,
                      hintText: 'Enter Password',
                      label: 'Password',
                      isapasswordfield: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(onPressed: (){
                      submit();
                    },
                        style: ButtonStyle(
                          minimumSize: WidgetStatePropertyAll(
                            Size.fromHeight(40),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: Text('Submit')),
                    SizedBox(
                      height: 10,
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Don't have an account?  ",
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(Routenames.register);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
      ),// safearea  taki appbar ki jagah mile naki cintent upar chipke
    );
  }
}
