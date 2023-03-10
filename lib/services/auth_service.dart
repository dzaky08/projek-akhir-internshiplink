import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internshiplink/models/intern_model.dart';
import 'package:internshiplink/models/supervisor_model.dart';
import 'package:internshiplink/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  GetStorage box = GetStorage();

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
            .eq('email', email)
            .limit(1)
            .withConverter<UserModel>(
              (data) => UserModel.fromJson(data[0]),
            );

        // TODO: [DONE] simpan userData ke local database, disini pake get storage biar bisa masuk sekaligus dalam bentuk json
        await box.write('userData', userData.toJson());

        // TODO: [DONE] sebelum return true, cek dulu user yang login role nya apa dan dapetin datanya
        if (userData.role == 'intern') {
          InternModel internData = await Supabase.instance.client
              .from('interns')
              .select()
              .match(
                {'userID': userData.id},
              )
              .limit(1)
              .withConverter<InternModel>(
                (data) => InternModel.fromJson(data[0]),
              );

          // TODO: [DONE] setelah dapet data nya, lalu simpan di local database
          await box.write('internData', internData.toJson());
        } else if (userData.role == 'supervisor') {
          SupervisorModel supervisorData = await Supabase.instance.client
              .from('supervisors')
              .select()
              .match({'userID': userData.id})
              .limit(1)
              .withConverter<SupervisorModel>(
                (data) => SupervisorModel.fromJson(data[0]),
              );

          // TODO: [DONE] setelah dapet data nya, lalu simpan di local database, seperti contoh di atas
          await box.write('internData', supervisorData.toJson());
        }

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
        GetStorage box = GetStorage();
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
        await box.write('userData', userData.toJson());

        List<dynamic> internData = await Supabase.instance.client
            .from('interns')
            .insert({
              'userID': userData.id,
              'createdAt': DateTime.now().toIso8601String(),
            })
            .select()
            .limit(1);

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
      GetStorage box = GetStorage();
      box.erase();

      return true;
    } catch (e) {
      debugPrint(e.toString());

      return false;
    }
  }
}
