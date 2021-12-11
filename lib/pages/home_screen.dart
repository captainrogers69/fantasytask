import 'package:fantasytask/custom_exception.dart';
import 'package:fantasytask/models/user.dart';
import 'package:fantasytask/services/auth_services.dart';
import 'package:fantasytask/services/user_detail_service.dart';
import 'package:fantasytask/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'editprofile_page.dart';

final userDetailsFutureProvider =
    FutureProvider.autoDispose<UserInApp>((ref) async {
  final user = ref.read(userDetailServiceProvider).getYourInfo();

  return user;
});

class MyHomePage extends HookWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final userProvider =
        useProvider(authencationServiceProvider).getCurrentUser();
    final userDetailProvider = useProvider(userDetailsFutureProvider);

    Future<void> _launchURLBrowser() async {
      const url = 'https://github.com/captainrogers69';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return userDetailProvider.when(
        data: (data) {
          return Scaffold(
            // appBar: AppBar(
            //   backgroundColor: Colors.deepPurple,
            // ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 8,
                      margin:
                          const EdgeInsets.only(right: 20, left: 20, top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SimpleDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(25),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  "Log Out Confirm ?",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text("Cancel"),
                                                    ),
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .deepPurple),
                                                      ),
                                                      onPressed: () async {
                                                        await context
                                                            .read(
                                                                authencationServiceProvider)
                                                            .signOut();
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text("Log Out"),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(Icons.menu)),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: const [
                                    Text(
                                      "Mayank Yadav",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Flutter Developer",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: InkWell(
                                    highlightColor: Colors.redAccent,
                                    onTap: //() {},
                                        // _launchURLApp,
                                        _launchURLBrowser,
                                    child: const Text(
                                      "https://github.com/captainrogers69",
                                      style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat',
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.deepPurple,
                            backgroundImage:
                                AssetImage("assets/official_pp.jpg"),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                      color: Colors.deepPurple,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          right: 30, left: 30, top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: const [
                              Text(
                                "13",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Applications",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: const [
                              Text(
                                "15",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: const [
                              Text(
                                "12",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Following",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                      color: Colors.deepPurple,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          right: 30, left: 30, bottom: 20, top: 10),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Experience",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    data.experience,
                                    style: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1 / 2,
                            indent: 30,
                            endIndent: 30,
                            color: Colors.deepPurple,
                          ),
                          const SizedBox(height: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Location",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: const [
                                  Icon(Icons.location_pin, size: 17),
                                  Text(
                                    "Noida, India",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1 / 2,
                            indent: 30,
                            endIndent: 30,
                            color: Colors.deepPurple,
                          ),
                          // SizedBox(height: 25),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Contact",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: const [
                                  Icon(Icons.call, size: 17),
                                  SizedBox(width: 10),
                                  Text(
                                    "+918979642723",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(Icons.mail, size: 17),
                                  const SizedBox(width: 10),
                                  Text(
                                    userProvider!.email!,
                                    style: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                      color: Colors.deepPurple,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          right: 30, left: 30, bottom: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Personal Details",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "22",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Age",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                              Container(
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "168" "cm",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Height",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                              Container(
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "84" "kg",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Weight",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                      color: Colors.deepPurple,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          right: 30, left: 30, bottom: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "About",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Whatever_it_takes!!",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          right: 30, left: 30, bottom: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "About",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Whatever_it_takes!!",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.deepPurple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfilePage(),
                  ),
                );
              },
              child: const Icon(Icons.edit),
            ),
          );
        },
        loading: () => Container(child: const CircularProgressIndicator()),
        error: (e, s) {
          return const Text("opps something went wrong");
        });
  }
}
