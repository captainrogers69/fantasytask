import 'dart:io';

import 'package:fantasytask/general_providers.dart';
import 'package:fantasytask/services/auth_services.dart';
import 'package:fantasytask/services/user_detail_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends HookWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final designationController = useTextEditingController();
    final gitController = useTextEditingController();
    final phoneController = useTextEditingController();
    final experienceController = useTextEditingController();
    final locationController = useTextEditingController();
    final aboutController = useTextEditingController();
    final userDetailProvider = useProvider(userDetailServiceProvider);

    final isLoading = useState(false);

    final imageProvider = useProvider(imagePickerProvider);
    final imagePath = useState("");

    Future<XFile?> imagePicker() async {
      final image = await imageProvider.pickImage(source: ImageSource.gallery);

      if (image != null) {
        imagePath.value = image.path;
        return image;
      }
    }

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: const Text("Edit your Profile"),
          ),
          body: isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.deepPurple,
                                radius: 50,
                                backgroundImage: imagePath.value.isEmpty
                                    ? null
                                    : Image.file(File(imagePath.value)).image),
                            InkWell(
                              onTap: () async {
                                await imagePicker().then((xFile) async {
                                  if (xFile != null) {
                                    final filePath = xFile.path;
                                    final file = File(filePath);
                                    await context
                                        .read(storageServiceProvider)
                                        .uploadProfileImage(file);
                                  }
                                });
                              },
                              child: const Center(
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0, left: 15),
                        child: Column(
                          children: [
                            TextField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.deepPurple,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.redAccent, //0xffF14C37
                                    width: 2,
                                  ),
                                ),
                                hintText: "Enter Your New Name",
                                hintStyle:
                                    const TextStyle(color: Colors.deepPurple),
                                helperText: 'What should we call you?',
                                helperStyle: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: designationController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.deepPurple,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.redAccent, //0xffF14C37
                                    width: 2,
                                  ),
                                ),
                                hintText: "Your Designation",
                                hintStyle:
                                    const TextStyle(color: Colors.deepPurple),
                                helperText: 'What do you do?',
                                helperStyle: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: gitController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.deepPurple,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.redAccent, //0xffF14C37
                                    width: 2,
                                  ),
                                ),
                                hintText: "Your github link",
                                hintStyle:
                                    const TextStyle(color: Colors.deepPurple),
                                helperText: 'Projects',
                                helperStyle: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: phoneController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.deepPurple,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.redAccent, //0xffF14C37
                                    width: 2,
                                  ),
                                ),
                                hintText: "Enter Your Phone Number",
                                hintStyle:
                                    const TextStyle(color: Colors.deepPurple),
                                helperText: 'How should we contact you?',
                                helperStyle: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: experienceController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.deepPurple,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.redAccent, //0xffF14C37
                                    width: 2,
                                  ),
                                ),
                                hintText: "Enter your Experience",
                                hintStyle:
                                    const TextStyle(color: Colors.deepPurple),
                                helperText: 'months',
                                helperStyle: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: locationController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.deepPurple,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.redAccent, //0xffF14C37
                                    width: 2,
                                  ),
                                ),
                                hintText: "Enter Your nearby location",
                                hintStyle:
                                    const TextStyle(color: Colors.deepPurple),
                                helperText: 'Where should we find you?',
                                helperStyle: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: aboutController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.deepPurple,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.redAccent, //0xffF14C37
                                    width: 2,
                                  ),
                                ),
                                hintText: "Tell us something about yourself",
                                hintStyle:
                                    const TextStyle(color: Colors.deepPurple),
                                helperText: 'About',
                                helperStyle: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple),
                          onPressed: () async {
                            isLoading.value = true;

                            await userDetailProvider.addUserInfo(
                              designationController.text,
                              gitController.text,
                              phoneController.text,
                              experienceController.text,
                              locationController.text,
                              aboutController.text,
                            );

                            isLoading.value = false;
                          },
                          child: const Text("Update Profile")),
                    ],
                  ),
                )),
    );
  }
}
