import 'package:flutter/material.dart';

class ReadPoem extends StatefulWidget {
  @override
  _ReadPoemState createState() => _ReadPoemState();
}

class _ReadPoemState extends State<ReadPoem> {
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
                ),

                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.pause),
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
                      Text('일시정지'),
                    ],
                  ),
                ),
                Container(
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
                  Text('하얀눈 하얀 눈처럼'),
                  SizedBox(height: 12.0,),
                  Text('되게 좋았던 풍경이고 눈들이었다'),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '댓글쓰기',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: '응원을 적어주세요',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          //width: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
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


