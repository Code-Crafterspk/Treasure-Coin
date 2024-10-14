import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(String) onImageUpload;

  const ImagePickerWidget({Key? key, required this.onImageUpload}) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  String? _imageUrl;
  File? _localImage;
  bool _loading = false;
  final ImagePicker _picker = ImagePicker();

  // Firebase references
  final auth = FirebaseAuth.instance;
  final databaseRef = FirebaseDatabase.instance.ref('user_images');
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    _loadUserProfileImage();
  }

  Future<void> _loadUserProfileImage() async {
    final user = auth.currentUser;
    if (user != null) {
      try {
        // Fetch the image URL from the database
        final snapshot = await databaseRef.child(user.uid).get();
        if (snapshot.exists) {
          final data = snapshot.value as Map<dynamic, dynamic>;
          String? imageUrl = data['profilePictureUrl'] as String?;
          if (imageUrl != null) {
            setState(() {
              _imageUrl = imageUrl;
              _localImage = null; // Clear any local image when loading from URL
            });
          }
        }
      } catch (e) {
        _showErrorSnackBar('Failed to load profile image: $e');
      }
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (pickedFile != null) {
      setState(() {
        _localImage = File(pickedFile.path);
        _imageUrl = null; // Clear the URL when a new image is picked
        _loading = true;
      });
      await _uploadImage(_localImage!);
    } else {
      _showErrorSnackBar('No image selected');
    }
  }

  Future<void> _uploadImage(File image) async {
    final user = auth.currentUser;
    if (user == null) {
      _showErrorSnackBar('User not authenticated');
      setState(() {
        _loading = false;
      });
      return;
    }

    try {
      final ref = storage.ref('/user_images/${user.uid}/${DateTime.now().millisecondsSinceEpoch}.jpg');
      final uploadTask = ref.putFile(image);

      await uploadTask.whenComplete(() async {
        final newURL = await ref.getDownloadURL();
        await databaseRef.child(user.uid).set({
          'profilePictureUrl': newURL,
        });
        widget.onImageUpload(newURL);
        setState(() {
          _imageUrl = newURL;
          _localImage = null; // Clear the local image after successful upload
        });
        _showSuccessSnackBar('Image uploaded successfully!');
      });
    } catch (e) {
      _showErrorSnackBar('Failed to upload image: $e');
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: _getBackgroundImage(),
            child: _showPlaceholder() ? Icon(Icons.camera_alt, color: Colors.grey.shade800, size: 50) : null,
          ),
        ),
        SizedBox(height: 15),
        if (_loading) CircularProgressIndicator(),
      ],
    );
  }

  ImageProvider? _getBackgroundImage() {
    if (_localImage != null) {
      return FileImage(_localImage!);
    } else if (_imageUrl != null) {
      return NetworkImage(_imageUrl!);
    }
    return null;
  }

  bool _showPlaceholder() {
    return _localImage == null && _imageUrl == null;
  }
}