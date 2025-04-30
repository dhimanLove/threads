import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env{
  static final SUPABASE_KEY = dotenv.env['eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRmcnF4aG5jcGpwZ3Nwd3FrcWlhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzcyNzI3MTIsImV4cCI6MjA1Mjg0ODcxMn0.MJZxiJkw-Kp62yM8jbBaoGyd9ZGOY3fRBedCjTGHNdw']!;
  static final SUPABASE_URL = dotenv.env['https://tfrqxhncpjpgspwqkqia.supabase.co']!;
}