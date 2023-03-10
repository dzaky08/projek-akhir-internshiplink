import 'package:flutter/material.dart';
import 'package:internshiplink/models/intern_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InternService {
  final SupabaseClient _supabase = Supabase.instance.client;

  final String table = 'interns';

  Future getInterns() async {
    try {
      List<
          Map<String,
              dynamic>> supervisors = await _supabase.from(table).select(
          '''*, user:userID(*), generation:generations(*), supervisor:supervisors(*), ''');
      //.select();
      return supervisors;
    } catch (e) {
      debugPrint(e.toString());

      return false;
    }
  }

  Future insertIntern({required Map<String, dynamic> data}) async {
    try {
      await _supabase.from(table).insert(data).select();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future updateIntern({
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
          .withConverter<InternModel>((data) => InternModel.fromJson(data[0]));

      return data;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future destroyIntern({required int id}) async {
    try {
      await _supabase.from(table).delete().match({'id': id});
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
