import 'dart:io';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UploadService {
  Future<String?> uploadImageSupervisor(File image) async {
    try {
      DateTime date = DateTime.now();
      String path =
          await Supabase.instance.client.storage.from('photos').upload(
                'photo_${date.day}${date.month}${date.year}${date.hour}${date.minute}${date.second}${date.microsecond}.png',
                image,
                fileOptions: const FileOptions(
                  cacheControl: '3600',
                  upsert: false,
                ),
              );

      return path;
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  Future<String?> uploadImageIntern(File image) async {
    try {
      DateTime date = DateTime.now();
      String path =
          await Supabase.instance.client.storage.from('selfiephoto').upload(
                'photo_${date.day}${date.month}${date.year}${date.hour}${date.minute}${date.second}${date.microsecond}.png',
                image,
                fileOptions: const FileOptions(
                  cacheControl: '3600',
                  upsert: false,
                ),
              );

      return path;
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  Future<String?> uploadImagePost(File image) async {
    try {
      DateTime date = DateTime.now();
      String path =
          await Supabase.instance.client.storage.from('postphoto').upload(
                'photo_${date.day}${date.month}${date.year}${date.hour}${date.minute}${date.second}${date.microsecond}.png',
                image,
                fileOptions: const FileOptions(
                  cacheControl: '3600',
                  upsert: false,
                ),
              );

      return path;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
