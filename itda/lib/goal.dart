import 'package:flutter/material.dart';

class GoalPage extends StatefulWidget{
  @override
  _GoalPageState createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  final _todaytextController = TextEditingController();
  final _weektextController = TextEditingController();
  final _yeartextController = TextEditingController();

   String today =" ";
   String week ="";
   String year="";

  Widget _todaybuildTextComposer() {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child:  Row(                             // NEW
        children: [
          Flexible(                           // NEW
            child:  TextField(
              controller: _todaytextController,
              onSubmitted: _todayhandleSubmitted,
              decoration:  InputDecoration.collapsed(
                  hintText: "오늘의 목표"),
            ),
          ), // NEW
          Flexible(                           // NEW
            child: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _todayhandleSubmitted(_todaytextController.text)),
          ),                                    // NEW
        ],                                      // NEW
      ),                                        // NEW
    );
  }

  Widget _weekbuildTextComposer() {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child:  Row(                             // NEW
        children: [
          Flexible(                           // NEW
            child:  TextField(
              controller: _weektextController,
              onSubmitted: _weekhandleSubmitted,
              decoration:  InputDecoration.collapsed(
                  hintText: "이번 주의 목표"),
            ),
          ), // NEW
          Flexible(                           // NEW
            child: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _weekhandleSubmitted(_weektextController.text)),
          ),                                    // NEW
        ],                                      // NEW
      ),                                        // NEW
    );
  }

  Widget _yearbuildTextComposer() {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child:  Row(                             // NEW
        children: [
          Flexible(                           // NEW
            child:  TextField(
              controller: _yeartextController,
              onSubmitted: _yearhandleSubmitted,
              decoration:  InputDecoration.collapsed(
                  hintText: "올해의 목표"),
            ),
          ), // NEW
          Flexible(                           // NEW
            child: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _yearhandleSubmitted(_yeartextController.text)),
          ),                                    // NEW
        ],                                      // NEW
      ),                                        // NEW
    );
  }

  void _todayhandleSubmitted(String text) {
    setState(() {
      today = text;
    });

    _todaytextController.clear();
  }
  void _weekhandleSubmitted(String text) {
    setState(() {
      week = text;
    });

    _weektextController.clear();
  }
  void _yearhandleSubmitted(String text) {
    setState(() {
      year = text;
    });

    _yeartextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            title: Text(
              '목표를 잇다',
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
                  Center(
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

                  Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "오늘의 목표: ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          today,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "이번 주의 목표: ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          week,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "올해의 목표: ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          year,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),

                  _todaybuildTextComposer(),
                  _weekbuildTextComposer(),
                  _yearbuildTextComposer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}