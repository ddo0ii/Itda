//https://github.com/rajayogan/flutterui-curveddesigns
import 'package:flutter/material.dart';
import 'connectPoem.dart';

class ConnectHeart extends StatefulWidget {
  @override
  _ConnectHeartState createState() => _ConnectHeartState();
}

class _ConnectHeartState extends State<ConnectHeart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Text('마음을 잇다',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18.0,
                        color: Colors.white)),
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 50.0),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              children: <Widget>[
                Text('시, 동화, 노래, 일기를 통해 나의 마음을 다스리고 상대방을 이해하기 위해 노력해 보아요.',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),

          SizedBox(height: 40.0),

          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: ListView(children: [
                      FlatButton(
                        child: Text('파이어베이스'),
                        onPressed: () => {
                          Navigator.pushNamed(context, '/fire')
                        },
                        color: Colors.blueAccent,
                        textColor:Colors.black,
                      ),
                      GestureDetector(
                        child: _buildConnectItem('assets/book.jpg', '시를 잇다', '함께 시를 이어봐요'),
                        onTap: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ConnectPoem()))
                        },
                      ),
                      _buildConnectItem('assets/openbook.jpg', '이야기를 잇다', '함께 이야기를 이어봐요'),
                      _buildConnectItem('assets/cloud.jpg', '노래를 잇다', '함께 노래를 이어봐요'),
                      SizedBox(height: 35.0),
                      Text('나의 마음을 시, 동화, 노래, 일기로 녹음하여 \n다른 학교 친구들과 나눌 수 있어요 함께 해 볼까요?',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: 12.0),
                        textAlign: TextAlign.center,
                      ),
                    ],),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectItem(String imgPath, String linkName, String detail) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                child: Row(
                    children: [
                      Image(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0
                      ),
                      SizedBox(width: 10.0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text(
                                linkName,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            Text(
                                detail,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.0,
                                    color: Colors.grey
                                )
                            )
                          ]
                      ),
                    ]
                )
            ),
          ],
        )
    );
  }
}
