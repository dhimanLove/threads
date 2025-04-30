import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:threads/Services/storageservice.dart';
import 'package:threads/routes/routenames.dart';
import 'package:threads/utils/storage_keys.dart';

import '../Services/Supabaseservice.dart';

class Authcontroller extends GetxController {
  Future<void> register(
      String email,
      String password,
      String name,
      ) async {
    try {
      final AuthResponse data = await Supabaseservice.client.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );
      if (data.user != null) {
        Storageservice.session.write(StorageKeys.usersession,data .session!.toJson() );
        Get.offAllNamed(Routenames.home);
      }
    } on AuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message,
        snackPosition: SnackPosition.TOP,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        snackStyle: SnackStyle.FLOATING,
        margin: EdgeInsets.all(0.0),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
Future<void> login(String email, String password) async {
try {
  final AuthResponse response = await Supabaseservice.client.auth.signInWithPassword(
    email: email,
    password: password,
  );
if(response.user!=null){
  Storageservice.session.write(StorageKeys.usersession, response.session!.toJson());
  Get.offAllNamed(Routenames.home);
}
}

on AuthException catch (e) {
  Get.snackbar(
    'Error',
    e.message,
  );
}
}