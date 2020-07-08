//https://minwook-shin.github.io/flutter-use-image-picker/ -->imagepicker
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'mealList.dart';

class MakeMeal extends StatefulWidget {
  @override
  _MakeMealState createState() => _MakeMealState();
}

class _MakeMealState extends State<MakeMeal> {
  File _image;
  final _formKey = GlobalKey<FormState>();
  bool tanVal = false;
  bool danVal = false;
  bool jiVal = false;

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
        title: Text('식사를 잇다',
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
            SizedBox(height: 15.0),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('내가만든식단',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: getGalleryImage,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
                            child: Container(
                              height: 80.0,
                              width: 80.0,
                              child: _image == null ? Text('No image') : Image.file(_image),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10.0,
                                      offset: Offset(0.0, 10.0))
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: getGalleryImage,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 3.0),
                            child: Container(
                              height: 80.0,
                              width: 80.0,
                              child: _image == null ? Text('No image') : Image.file(_image),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10.0,
                                      offset: Offset(0.0, 10.0))
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: getGalleryImage,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
                            child: Container(
                              height: 80.0,
                              width: 80.0,
                              child: _image == null ? Text('No image') : Image.file(_image),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10.0,
                                      offset: Offset(0.0, 10.0))
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: getGalleryImage,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 3.0),
                            child: Container(
                              height: 80.0,
                              width: 80.0,
                              child: _image == null ? Text('No image') : Image.file(_image),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10.0,
                                      offset: Offset(0.0, 10.0))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: getGalleryImage,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            child: Container(
                              height: 100.0,
                              width: 100.0,
                              child: _image == null ? Text('No image') : Image.file(_image),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10.0,
                                      offset: Offset(0.0, 10.0))
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: getGalleryImage,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            child: Container(
                              height: 100.0,
                              width: 100.0,
                              child: _image == null ? Text('No image') : Image.file(_image),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10.0,
                                      offset: Offset(0.0, 10.0))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12.0,),
                  Text('영양소확인'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            value: tanVal,
                            onChanged: (bool value) {
                              setState(() {
                                tanVal = value;
                              });
                            },
                          ),
                          Text("탄수화물"),
                        ],
                      ),
                      // [Tuesday] checkbox
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            value: danVal,
                            onChanged: (bool value) {
                              setState(() {
                                danVal = value;
                              });
                            },
                          ),
                          Text("단백질"),
                        ],
                      ),
                      // [Wednesday] checkbox
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            value: jiVal,
                            onChanged: (bool value) {
                              setState(() {
                                jiVal = value;
                              });
                            },
                          ),
                          Text("지방"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(12.0),
                        child: RaisedButton(
                          color: Colors.indigo,
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.camera_alt),
                                color: Colors.white,
                              ),
                              Text('캡쳐하기'),
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
                                icon: Icon(Icons.file_upload),
                                color: Colors.white,
                              ),
                              Text('잇기'),
                            ],
                          ),
                          //textColor: Colors.white,
                          elevation: 8.0,
                          onPressed: () => {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MealList()))
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
  getGalleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
  getCameraImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }
}


