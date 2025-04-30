import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Supabaseservice extends GetxController{
  //jab tk app rhega tb tk memory e delete nai hoga instance
  // for example jab home screen se navigate krke user kisi or page pe jayega , tab ye delete ho jayega homepage
  static final Supabaseservice instance = Get.find();
  static final SupabaseClient client = Supabase.instance.client;
}