import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EditProfilePage extends HookWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final imageProvider = useProvider(imagePickerProvider);
    // final imagePath = useState("");

    // Future<XFile?> imagePicker() async {
    //   final image = await imageProvider.pickImage(source: ImageSource.gallery);

    //   if (image != null) {
    //     imagePath.value = image.path;
    //     return image;
    //   }
    // }

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text("Edit your Profile"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
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
                        // backgroundImage:
                        // imagePath.value.isEmpty
                        //     ? null
                        //     : Image.file(File(imagePath.value)).image
                      ),
                      InkWell(
                        onTap: () async {
                          // await imagePicker().then((xFile) async {
                          //   if (xFile != null) {
                          //     final filePath = xFile.path;
                          //     final file = File(filePath);
                          //     await context
                          //         .read(storageServiceProvider)
                          //         .uploadProfileImage(file);
                          //   }
                          // });
                        },
                        child: Center(
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.0, left: 15),
                    child: Column(
                      children: [
                        TextField(
                          // controller: usernameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.deepPurple,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.redAccent, //0xffF14C37
                                width: 2,
                              ),
                            ),
                            hintText: "Enter Your New Name",
                            hintStyle: TextStyle(color: Colors.deepPurple),
                            helperText: 'What should we call you?',
                            helperStyle: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          // controller: usernameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.deepPurple,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.redAccent, //0xffF14C37
                                width: 2,
                              ),
                            ),
                            hintText: "Your Designation",
                            hintStyle: TextStyle(color: Colors.deepPurple),
                            helperText: 'What do you do?',
                            helperStyle: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                              // controller: usernameController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.deepPurple,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.redAccent, //0xffF14C37
                                    width: 2,
                                  ),
                                ),
                                hintText: "Your github link",
                                hintStyle: TextStyle(color: Colors.deepPurple),
                                helperText: 'Projects',
                                helperStyle: TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 10),
                        TextField(
                          // controller: usernameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.deepPurple,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.redAccent, //0xffF14C37
                                width: 2,
                              ),
                            ),
                            hintText: "Enter Your Phone Number",
                            hintStyle: TextStyle(color: Colors.deepPurple),
                            helperText: 'How should we contact you?',
                            helperStyle: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          // controller: usernameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.deepPurple,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.redAccent, //0xffF14C37
                                width: 2,
                              ),
                            ),
                            hintText: "Enter your Experience",
                            hintStyle: TextStyle(color: Colors.deepPurple),
                            helperText: 'months',
                            helperStyle: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          // controller: usernameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.deepPurple,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.redAccent, //0xffF14C37
                                width: 2,
                              ),
                            ),
                            hintText: "Enter Your nearby location",
                            hintStyle: TextStyle(color: Colors.deepPurple),
                            helperText: 'Where should we find you?',
                            helperStyle: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        
                        SizedBox(height: 10),
                        TextField(
                          // controller: usernameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.deepPurple,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.redAccent, //0xffF14C37
                                width: 2,
                              ),
                            ),
                            hintText: "Tell us something about yourself",
                            hintStyle: TextStyle(color: Colors.deepPurple),
                            helperText: 'About',
                            helperStyle: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(),
              ],
            ),
          )),
    );
  }
}
