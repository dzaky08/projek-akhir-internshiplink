import 'package:flutter/material.dart';
import 'package:internshiplink/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      AuthResponse authResponse =
          await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (authResponse.user != null && authResponse.session != null) {
        UserModel userData = await Supabase.instance.client
            .from('users')
            .select()
            .limit(1)
            .withConverter<UserModel>(
              (data) => UserModel.fromJson(data[0]),
            );

        // TODO: Simpan data ke local database
        debugPrint(userData.toString());

        return true;
      } else {
        debugPrint('Login Failed!');

        return false;
      }
    } catch (e) {
      debugPrint(e.toString());

      return false;
    }
  }

  Future<bool> signup({
    required String email,
    required String password,
    required String fullname,
  }) async {
    try {
      AuthResponse authResponse = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );

      if (authResponse.user != null && authResponse.session != null) {
        UserModel userData = await Supabase.instance.client
            .from('users')
            .insert({
              'uid': authResponse.user!.id,
              'email': email,
              'name': fullname,
              'role': 'intern',
              'status': 'aktif',
              'createdAt': DateTime.now().toIso8601String(),
            })
            .select()
            .limit(1)
            .withConverter<UserModel>(
              (data) => UserModel.fromJson(data[0]),
            );

        // TODO: Simpan data ke local database
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("email", email);
        await prefs.setString("password", password);
        await prefs.setString('role', userData.role);

        return true;
      } else {
        debugPrint('Sign Up Failed!');

        return false;
      }
    } catch (e) {
      debugPrint(e.toString());

      return false;
    }
  }

  Future<bool> logout() async {
    try {
      await Supabase.instance.client.auth.signOut();

      return true;
    } catch (e) {
      debugPrint(e.toString());

      return false;
    }
  }
}
