import 'package:flutter/material.dart';
// import 'package:line_icons/line_icon.dart';

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController txtctrl = TextEditingController();
    return Container(
      height: 100,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Colors.tealAccent,
            Colors.teal[300],
          ])),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Expanded(
              child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.bar_chart_rounded,
                  )),
              SizedBox(
                width: 10,
              ),
              Image(
                image: AssetImage("assets/amazon.png"),
              ),
              Expanded(child: Container()),
              Icon(Icons.mic),
              SizedBox(
                width: 10,
              ),
              Image(
                height: 30,
                image: AssetImage("assets/cart.png"),
              ),
              SizedBox(
                width: 10,
              )
            ],
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              // color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 8),
                  Icon(Icons.search),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: txtctrl,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelStyle: TextStyle(fontSize: 20),
                        hintText: 'Search',
                      ),
                    ),
                  ),
                  Icon(Icons.camera_alt),
                  SizedBox(width: 8)
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
