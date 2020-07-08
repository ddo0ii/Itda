import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignupPageState();
}

enum FormType { login, register }

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  final _nicknameController = TextEditingController();
  final _schoolController = TextEditingController();
  final _gradeController = TextEditingController();
  final _classController = TextEditingController();

  String _email;
  String email;
  String _password;
  String _passwordCheck;
  String _nickname;
  String _school;
  String _grade;
  String _class;
  FormType _formType = FormType.login;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final databaseReference = Firestore.instance;

  void validateAndSubmit() async {
    final form = formKey.currentState;

    if (form.validate()) {
      try {
          form.save();
          FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
              email: _email, password: _password))
              .user;
          print('Registered User: ${user.uid}');
          createRecord(_email,
              _nicknameController.text,
              _schoolController.text,
              _gradeController.text,
              _classController.text);
      } catch (e) {

        print('Error1: $e');
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void createRecord(String email, String nickname, String schoolname, String grade, String clas) async {
    await databaseReference.collection("loginInfo")
        .document(email)
        .setData({
      'nickname': nickname,
      'schoolname' : schoolname,
      'grade' : grade,
      'class' : clas,
      'point' : 0,
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login App'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: '이메일 (형식: abc@abc.com)'),
                validator: (value){
                  if(value.isEmpty) {
                    return '이메일을 입력해주세요';
                  }
                  if(!(value.contains('@') && value.contains('.')))
                    return '이메일 형식을 다시 확인해주세요';
                  email = value;
                  return null;
                },
                onSaved: (value) => _email = value,
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(labelText: '비밀번호 (6자리 이상)'),
                validator: (value){
                  if (value.isEmpty ) {
                    return '비밀번호를 입력해주세요';
                  }
                  if(value.length < 6)
                    return "비밀번호를 6자리 이상 입력해주세요";
                  _passwordCheck = value;
                  return null;
                },
                onSaved: (value) => _password = value,
                obscureText: true,
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(labelText: '비밀번호 확인'),
                validator: (value){
                  if (value.isEmpty || value != _passwordCheck) {
                    if(value.isEmpty)
                      return '입력한 비밀번호를 다시 입력해주세요';
                    if(value != _passwordCheck)
                      return '비밀번호를 다시 한 번 확인해주세요';
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(labelText: '닉네임'),
                controller: _nicknameController,
                validator: (value){
                  if (value.isEmpty) {
                    return "닉네임을 입력해주세요";
                  }

                  return null;
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(labelText: '학교'),
                controller: _schoolController,
                validator: (value){
                  if (value.isEmpty) {
                    return "학교를 입력해주세요";
                  }
                  _school = value;
                  return null;
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(labelText: '학년'),
                controller: _gradeController,
                validator: (value){
                  if (value.isEmpty) {
                    return "학년을 입력해주세요";
                  }
                  _grade = value;
                  return null;
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(labelText: '반'),
                controller: _classController,
                validator: (value){
                  if (value.isEmpty) {
                    return "반을 입력해주세요";
                  }
                  _class = value;
                  return null;
                },
              ),
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.white,
                    child: Text(
                      '가입완료',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    onPressed: () {
                      validateAndSubmit();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}