import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:threads/routes/routenames.dart';
import 'package:threads/widgets/Authinput.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController password = TextEditingController(
    text: '',
  );
  final TextEditingController confirmpassword = TextEditingController(
    text: '',
  );
  final TextEditingController name = TextEditingController(
    text: '',
  );

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController(
    text: '',
  );

  //Submit method//
  void submit(){
    //Get.snackbar('Success', 'Registration Successful');
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
                          Text('Register',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                          Text('Welcome to the threads! '),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),

                    Authinput(
                      validator:  ValidationBuilder(
                        ).required().minLength(3).maxLength(10).build(),
                      controller: name,
                      hintText: 'Name',
                      label: 'Name',
                      isapasswordfield: true,
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Authinput(
                      validator:  ValidationBuilder(
                      ).required().email().build(),
                      controller: email,
                      hintText: 'Enter Email',
                      label: 'Email',
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

                    Authinput(
                      validator: (arg){
                        if(arg!=password.text){
                          return 'Password do not match';
                        }
                        return null;
                      } ,
                      controller: confirmpassword,
                      hintText: 'Confirm Password',
                      label: ' Confirm Password',
                      isapasswordfield: true,
                    ),

                    SizedBox(
                      height: 10,
                    ),

                  ElevatedButton(
                    onPressed: () {
                      submit();
                      email.clear();
                      password.clear();
                      confirmpassword.clear();
                      name.clear();
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
                  ],
                ),
              ),
            ),
          ),
      ),
      ),// safearea  taki appbar ki jagah mile naki cintent upar chipke
    );
  }
}
