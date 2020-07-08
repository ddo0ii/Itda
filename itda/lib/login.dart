import 'package:flutter/material.dart';
import 'signup.dart';
import 'profile.dart';
import 'home.dart';
import 'goal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


final databaseReference = Firestore.instance;

String _email;
String _password;
final FirebaseAuth _auth = FirebaseAuth.instance;


GlobalKey<FormState> _loginKey = GlobalKey<FormState>(debugLabel: '_loginkey');
final form = _loginKey.currentState;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();


  void validateAndSubmit() async {
    if (form.validate()) {
      try {
          form.save();
          FirebaseUser user = (await _auth.signInWithEmailAndPassword(
              email: _email, password: _password)).user;
          print('Signed In: ${user.uid}');
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        print('Error: $e');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 100,),
          Center(
            child: Container(
              width: 80,
              height: 80,
              child: Image.asset('assets/Itda_black.png'),
            ),
          ),
          SizedBox(height: 50),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),

                children: <Widget>[
                  Column(
                    children: <Widget>[

                      SizedBox(height: 16.0),
                    ],
                  ),
                  SizedBox(height: 120.0),
                  Form(
                    key: _loginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Email',
                          ),
                          validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                          onSaved: (value) => _email = value,
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                          onSaved: (value) => _password = value,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text('취소'),
                        onPressed: () {
                          _usernameController.clear();
                          _passwordController.clear();
                        },
                      ),
                      RaisedButton(
                        child: Text('회원가입'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignupPage()));
                        },
                      ),
                      RaisedButton(
                        child: Text('다음'),
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
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.icon,
        this.hint,
        this.obsecure = false,
        this.validator,
        this.onSaved});
  final FormFieldSetter<String> onSaved;
  final Icon icon;
  final String hint;
  final bool obsecure;
  final FormFieldValidator<String> validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        autofocus: true,
        obscureText: obsecure,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
            ),
            prefixIcon: Padding(
              child: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColor),
                child: icon,
              ),
              padding: EdgeInsets.only(left: 30, right: 10),
            )),
      ),
    );
  }
}
