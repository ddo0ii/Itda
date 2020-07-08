import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppBar(
            centerTitle: true,
            elevation: 0,
            title: Text(
              '도움말',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 200,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Icon(
                            Icons.favorite,
                            size: 80,
                            color: Colors.red,
                          )
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "마음을 잇다",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                      "시, 이야기, 노래를 통해\n"
                                      "나의 마음을 다스리고\n"
                                      "상대방을 이해하기 위해 노력해 보아요",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          )
                        ),
                      ],
                    )
                  ),
                  Container(
                      height: 200,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Icon(
                                Icons.description,
                                size: 80,
                                color: Colors.grey,
                              )
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "목표를 잇다",
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "내 목표를 정하고\n"
                                          "친구들과 이야기하여\n"
                                          "실천 의지를 높여요",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      )
                  ),
                  Container(
                      height: 200,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Icon(
                                Icons.local_dining,
                                size: 80,
                                color: Colors.green,
                              )
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "식사를 잇다",
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.greenAccent,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "우리 학교 식단을 보고\n"
                                          "내가 먹고 싶은 메뉴를 계획하\n"
                                          "친구, 선생님, 부모님께 보여줄 수 있어요",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      )
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