import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';

import 'home.dart';

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return MaterialApp(
      // アプリ名
      title: 'ChatApp',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
      ),
      // ログイン画面を表示
      home: RegisterPage(),
    );
  }
}

// ログイン画面用Widget
class RegisterPage extends StatefulWidget {
  @override
  Register createState() => Register();
}

class Register extends State<RegisterPage> {
  // メッセージ表示用

  String infoText = '';
  // 入力したメールアドレス・パスワード

  String email = '';
  String password = '';
  String name = '';
  late File imageFile;

  Future showImagePicker() async {
    final _picker = ImagePicker();
    final pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
      maxWidth: null,
      maxHeight: null,
      imageQuality: null,
    );
    File imageFile = File(pickedFile!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                  onTap: () async {
                    await showImagePicker();
                  },
                  child: imageFile != null
                      ? Image.file(imageFile)
                      : Container(
                          color: Colors.green,
                        )),
              //名前の入力
              TextFormField(
                decoration: InputDecoration(labelText: '名前'),
                onChanged: (String value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              // メールアドレス入力
              TextFormField(
                decoration: InputDecoration(labelText: 'メールアドレス'),
                onChanged: (String value) {
                  setState(() {
                    email = value;
                  });
                },
              ),

              // パスワード入力
              TextFormField(
                decoration: InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    password = value;
                  });
                },
              ),

              Container(
                padding: EdgeInsets.all(8),
                // メッセージ表示
                child: Text(infoText),
              ),
              Container(
                width: double.infinity,
                // ユーザー登録ボタン
                child: ElevatedButton(
                  child: Text('ユーザー登録'),
                  onPressed: () async {
                    try {
                      // メール/パスワードでユーザー登録
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final result = await auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      final uid = result.user!.uid;
                      FirebaseFirestore.instance.collection('users').add({
                        'email': email,
                        'name': name,
                      });
                      // ユーザー登録に成功した場合
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return HomePage(result.user!);
                        }),
                      );
                    } catch (e) {
                      // ユーザー登録に失敗した場合
                      setState(() {
                        infoText = "登録に失敗しました：${e.toString()}";
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
