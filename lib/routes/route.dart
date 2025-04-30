
import 'package:get/get.dart';
import 'package:threads/Views/Auth/Register.dart';
import 'package:threads/Views/Auth/login.dart';
import 'package:threads/Views/home.dart';
import 'package:threads/routes/routenames.dart';


class Routes{
  static final pages =[
    GetPage(name: Routenames.home, page: ()=>Home()),
    GetPage(name: Routenames.login, page: ()=> Login()),
    GetPage(name: Routenames.register, page: ()=>Register())
  ];
}