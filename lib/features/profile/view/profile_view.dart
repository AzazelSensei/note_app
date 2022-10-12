import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/common_libs.dart';
import 'package:note_app/core/components/default_button.dart';
import 'package:note_app/core/init/theme/colors_manager.dart';
import 'dart:io';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _nameController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? image;

  Future pickImage() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
    if (image != null) {
      final Uint8List bytes = await image!.readAsBytes();
      final String base64Image = base64Encode(bytes);
      debugPrint(base64Image);
      // Image.memory( base64Decode(imageBase64), fit: BoxFit.cover )
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => pickImage(),
            child: CircleAvatar(
              backgroundColor: ColorManager.white,
              radius: 70,
              foregroundImage:
                  image == null ? null : FileImage(File(image!.path)),
            ),
          ),
          const Text('Name'),
          CustomTextField(
              xController: _nameController,
              hintText: "Name",
              icon: const Icon(Icons.person)),
          DefaultButton(
            fullWidthButton: true,
            color: ColorManager.mainTheme,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
