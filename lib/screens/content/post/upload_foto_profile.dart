import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internshiplink/supabase/supabase_constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Avatar extends StatefulWidget {
  const Avatar({
    super.key,
    required this.imageUrl,
    required this.onUpload,
  });

  final String? imageUrl;
  final void Function(String) onUpload;

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.imageUrl == null || widget.imageUrl!.isEmpty)
          Container(
            width: 150,
            height: 150,
            color: Colors.grey,
            child: const Center(
              child: Text('No Image'),
            ),
          )
        else
          Image.network(
            widget.imageUrl!,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ElevatedButton(
          onPressed: _isLoading ? null : _upload,
          child: const Text('Upload'),
        ),
      ],
    );
  }

  Future<void> _upload() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );
    if (imageFile == null) {
      return;
    }
    setState(() => _isLoading = true);

    try {
      final bytes = await imageFile.readAsBytes();
      final fileExt = imageFile.path.split('.').last;
      final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
      final filePath = fileName;
      await supabase.storage.from('avatars').uploadBinary(
            filePath,
            bytes,
            fileOptions: FileOptions(contentType: imageFile.mimeType),
          );
      final imageUrlResponse = await supabase.storage
          .from('avatars')
          .createSignedUrl(filePath, 60 * 60 * 24 * 365 * 10);
      widget.onUpload(imageUrlResponse);
    } on StorageException catch (error) {
      if (mounted) {
        context.showErrorSnackBar(message: error.message);
      }
    } catch (error) {
      if (mounted) {
        context.showErrorSnackBar(message: 'Unexpected error occurred');
      }
    }

    setState(() => _isLoading = false);
  }
}


  // String? _avatarUrl;
  // var _loading = false;

  // /// Called once a user id is received within `onAuthenticated()`
  // Future<void> _getProfile() async {
  //   setState(() {
  //     _loading = true;
  //   });

  //   try {
  //     final userId = supabase.auth.currentUser!.id;
  //     final data = await supabase
  //         .from('profiles')
  //         .select()
  //         .eq('id', userId)
  //         .single() as Map;
  //     _usernameController.text = (data['username'] ?? '') as String;
  //     _websiteController.text = (data['website'] ?? '') as String;
  //     _avatarUrl = (data['avatar_url'] ?? '') as String;
  //   } on PostgrestException catch (error) {
  //     context.showErrorSnackBar(message: error.message);
  //   } catch (error) {
  //     context.showErrorSnackBar(message: 'Unexpected exception occurred');
  //   }

  //   setState(() {
  //     _loading = false;
  //   });
  // }

  // /// Called when user taps `Update` button
  // Future<void> _updateProfile() async {
  //   setState(() {
  //     _loading = true;
  //   });
  //   final userName = _usernameController.text;
  //   final website = _websiteController.text;
  //   final user = supabase.auth.currentUser;
  //   final updates = {
  //     'id': user!.id,
  //     'username': userName,
  //     'website': website,
  //     'updated_at': DateTime.now().toIso8601String(),
  //   };
  //   try {
  //     await supabase.from('profiles').upsert(updates);
  //     if (mounted) {
  //       context.showSnackBar(message: 'Successfully updated profile!');
  //     }
  //   } on PostgrestException catch (error) {
  //     context.showErrorSnackBar(message: error.message);
  //   } catch (error) {
  //     context.showErrorSnackBar(message: 'Unexpeted error occurred');
  //   }
  //   setState(() {
  //     _loading = false;
  //   });
  // }

  // Future<void> _signOut() async {
  //   try {
  //     await supabase.auth.signOut();
  //   } on AuthException catch (error) {
  //     context.showErrorSnackBar(message: error.message);
  //   } catch (error) {
  //     context.showErrorSnackBar(message: 'Unexpected error occurred');
  //   }
  //   if (mounted) {
  //     Navigator.of(context).pushReplacementNamed('/');
  //   }
  // }

  // /// Called when image has been uploaded to Supabase storage from within Avatar widget
  // Future<void> _onUpload(String imageUrl) async {
  //   try {
  //     final userId = supabase.auth.currentUser!.id;
  //     await supabase.from('profiles').upsert({
  //       'id': userId,
  //       'avatar_url': imageUrl,
  //     });
  //     if (mounted) {
  //       context.showSnackBar(message: 'Updated your profile image!');
  //     }
  //   } on PostgrestException catch (error) {
  //     context.showErrorSnackBar(message: error.message);
  //   } catch (error) {
  //     context.showErrorSnackBar(message: 'Unexpected error has occurred');
  //   }
  //   if (!mounted) {
  //     return;
  //   }

  //   setState(() {
  //     _avatarUrl = imageUrl;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _getProfile();
  // }

  // @override
  // void dispose() {
  //   _usernameController.dispose();
  //   _websiteController.dispose();
  //   super.dispose();
  // }
