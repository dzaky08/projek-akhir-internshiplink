import 'package:flutter/material.dart';
import 'package:internshiplink/models/post_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostService {
  final SupabaseClient _supabase = Supabase.instance.client;

  final String table = 'posts';

  Future getPost() async {
    try {
      List<Map<String, dynamic>> posts = await _supabase
          .from(table)
          //     .select(
          // '''*, user:userID(*), generation:generations(*), supervisor:supervisors(*), ''');
          .select();
      return posts;
    } catch (e) {
      debugPrint(e.toString());

      return false;
    }
  }

  Future insertPost({required Map<String, dynamic> data}) async {
    try {
      await _supabase.from(table).insert(data).select();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future updatePost({
    required int userID,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _supabase
          .from(table)
          .update(data)
          .match({
            'userID': userID,
          })
          .select()
          .withConverter<PostModel>((data) => PostModel.fromJson(data[0]));

      return data;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future destroyPost({required int id}) async {
    try {
      await _supabase.from(table).delete().match({'id': id});
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
