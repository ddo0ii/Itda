import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:itda/makeMeal.dart';
import 'goal_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'help.dart';
import 'connectHeart.dart';
import 'makeMeal.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Firestore _firestore = Firestore.instance;
  FirebaseUser user ;
  String email="emial";
  String nickname="nick";
  String school = "school";
  String grade = "grade";
  String clas = "class";
  int point = -1;
  dynamic data;

  Future<String> getUser () async {
    user = await FirebaseAuth.instance.currentUser();
    DocumentReference documentReference =  Firestore.instance.collection("loginInfo").document(user.email);
    await documentReference.get().then<dynamic>(( DocumentSnapshot snapshot) async {
      setState(() {
        nickname =snapshot.data["nickname"];
        school = snapshot.data["schoolname"];
        grade = snapshot.data["grade"];
        clas = snapshot.data["class"];
        point = snapshot.data["point"];
      });
    });

  }

  @override
  void initState() {

    super.initState();
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.help,
              color: Colors.black,
            ),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpPage()));
            },
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 200,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: (){
                        getUser();
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 60,
                          height: 60,
                          child: Image.asset('assets/Itda.png'),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              nickname,
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  school,
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                Text(
                                  " "+grade+"학년",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                Text(
                                  " " + clas + "반",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: 300,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.control_point,
                                size: 20,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "$point",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: 10,),
                            ],

                          ),
                        ],
                      )
                    )
                  ],
                ),

                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        )
      ),
      body: ListView(

        children: <Widget>[
          SizedBox(height: 100),
          Center(
            child: Container(
              width: 80,
              height: 80,
              child: Image.asset('assets/Itda_black.png'),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0,0,10,0),
                  width: 100,
                  child: Divider(thickness: 2),
                ),
                Icon(
                  Icons.star,
                  color: Colors.black,
                  size: 15,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10,0,0,0),
                  width: 100,
                  child: Divider(thickness: 2),
                ),
              ],
            ),
          Center(
            child: Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "세상을 잇는 ",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "\""+nickname+"\"",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "을",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                Text(
                  "오늘도 응원합니다",
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ),
          SizedBox(height: 100),
          Center(
            child: ButtonTheme(
                minWidth: 200.0,
                height: 50.0,
                child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ConnectHeart()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    color: Colors.black,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
                          child: Text(
                            "마음을 잇다",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    )
                )
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: ButtonTheme(
                minWidth: 200.0,
                height: 50.0,
                child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Goal_ListPage()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    color: Colors.black,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
                          child: Icon(
                            Icons.description,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
                          child: Text(
                            "목표를 잇다",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    )
                )
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: ButtonTheme(
                minWidth: 200.0,
                height: 50.0,
                child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MakeMeal()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    color: Colors.black,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
                          child: Icon(
                            Icons.restaurant,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
                          child: Text(
                            "식사를 잇다",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    )
                )
            ),
          ),
        ],
      )
      // TODO: Set resizeToAvoidBottomInset (101)
    );
  }
}
