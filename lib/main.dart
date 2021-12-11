import 'package:fantasytask/custom_exception.dart';
import 'package:fantasytask/pages/home_screen.dart';
import 'package:fantasytask/pages/login_screen.dart';
import 'package:fantasytask/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:firebase_auth/firebase_auth.dart';

final authStreamProvider = StreamProvider.autoDispose<User?>((ref) {
  ref.maintainState = true;

  final userStream = ref.read(authencationServiceProvider).userchanges;

  return userStream;
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthChecker());
  }
}

class AuthChecker extends HookWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authState = useProvider(authStreamProvider);

    return _authState.when(
      data: (data) {
        if (data != null) {
          return const MyHomePage();
        } else {
          return const LoginScreen();
        }
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      error: (error, _) => Text(error is CustomExeption
          ? error.message!
          : "Something Went wrong, try again"),
    );
  }
}
