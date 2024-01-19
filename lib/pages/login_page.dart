import 'package:chatting_app/models/user_model.dart';
import 'package:chatting_app/pages/chat_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseFireStore = FirebaseFirestore.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _isLogin = true;

  @override
  void initState() {
    super.initState();
    _requestNotificationPermission();
  }

  void _requestNotificationPermission() async {
    NotificationSettings settings =
        await firebaseCloudMessaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await firebaseCloudMessaging.getToken();

      _updateTokenInDb(token!);

      firebaseCloudMessaging.onTokenRefresh.listen(
        (token) => _updateTokenInDb(token),
      );
    }
  }

  void _updateTokenInDb(String token) async {
    await firebaseFireStore
        .collection("users")
        .doc(firebaseAuthInstance.currentUser!.uid)
        .update(
      {"notificationToken": token},
    );
  }

  void _submit() async {
    //_formKey.currentState!.validate();
    _formKey.currentState!.save();

    if (_isLogin) {
      // Giriş Yap
      try {
        await firebaseAuthInstance.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );

        await firebaseFireStore
            .collection("users")
            .doc(firebaseAuthInstance.currentUser!.uid)
            .update(
          {'lastActive': DateTime.now()},
        );
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.message ?? "Giriş hatalı")));
      }
    } else {
      // Kayıt ol
      try {
        final userCredentials = await firebaseAuthInstance
            .createUserWithEmailAndPassword(email: _email, password: _password);

        // kayıt olundu..

        await firebaseFireStore
            .collection("users")
            .doc(userCredentials.user!.uid)
            .set(
              UserModel(
                id: userCredentials.user!.uid,
                name: "Cem",
                email: userCredentials.user!.email!,
                lastActive: Timestamp.now(),
                isOnline: true,
              ).toJson(),
            );
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.message ?? "Kayıt Hatalı")));
      }
    }
  }

  final _formKey = GlobalKey<FormState>();

  var _email = '';
  var _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: "E-posta"),
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (newValue) {
                            _email = newValue!;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: "Şifre"),
                          autocorrect: false,
                          obscureText: true,
                          onSaved: (newValue) {
                            _password = newValue!;
                          },
                        ),
                        ElevatedButton(
                            onPressed: () {
                              _submit();
                            },
                            child: Text(_isLogin ? "Giriş Yap" : "Kayıt Ol")),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(_isLogin
                                ? "Kayıt Sayfasına Git"
                                : "Giriş Sayfasına Git"))
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
