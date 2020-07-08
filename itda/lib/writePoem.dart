import 'package:flutter/material.dart';

class WritePoem extends StatefulWidget {
  @override
  _WritePoemState createState() => _WritePoemState();
}

class _WritePoemState extends State<WritePoem> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('마음을 잇다',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18.0,
                color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('시를잇다',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.record_voice_over),
                        color: Colors.white,
                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text('Processing Data')));
                          }
                        },
                      ),
                      Text('녹음'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.done),
                        color: Colors.white,
                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text('Processing Data')));
                          }
                        },
                      ),
                      Text('녹음완료'),
                    ],
                  ),
                ),Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.play_arrow),
                        color: Colors.white,
                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text('Processing Data')));
                          }
                        },
                      ),
                      Text('녹음듣기'),
                    ],
                  ),
                ),Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.stop),
                        color: Colors.white,
                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text('Processing Data')));
                          }
                        },
                      ),
                      Text('정지'),
                    ],
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //border: InputBorder.none,
                      labelText: '녹음 제목',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: '녹음 제목을 적어주세요',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          //width: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return '녹음 제목을 적어주세요';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12.0,),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '나의 느낌(다짐)',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: '느낌 또는 다짐을 적어주세요',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          //width: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return '느낌 또는 다짐을 적어주세요';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        //padding: EdgeInsets.all(12.0),
                        child: RaisedButton(
                          color: Colors.indigo,
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.link),
                                color: Colors.white,
                              ),
                              Text('잇기(올리기)'),
                            ],
                          ),
                          elevation: 8.0,
                          /*
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7.0)),
                          ),
                          */
                          onPressed: () {
                            // Validate returns true if the form is valid, or false
                            // otherwise.
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, display a Snackbar.
                              Scaffold.of(context)
                                  .showSnackBar(SnackBar(content: Text('Processing Data')));
                            }
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(12.0),
                        child: RaisedButton(
                          color: Colors.indigo,
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.lock),
                                color: Colors.white,
                              ),
                              Text('나만보기'),
                            ],
                          ),
                          elevation: 8.0,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Scaffold.of(context)
                                  .showSnackBar(SnackBar(content: Text('Processing Data')));
                            }
                          },
                        ),
                      ),
                      Container(
                        //padding: EdgeInsets.all(12.0),
                        child: RaisedButton(
                          color: Colors.indigo,
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.list),
                                color: Colors.white,
                              ),
                              Text('목록으로'),
                            ],
                          ),
                          //textColor: Colors.white,
                          elevation: 8.0,
                          onPressed: () => {
                            Navigator.of(context).pop(),
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}


