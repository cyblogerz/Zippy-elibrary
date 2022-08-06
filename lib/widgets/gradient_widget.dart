import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Card(
            margin: EdgeInsets.fromLTRB(10.0, 20.0, 3.0, 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 30.0,
            shadowColor: Colors.pink,
            child: Container(
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 50.0, 15.0),
              height: 101.0,
              width: 169.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Genres',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Explore variuos genres',
                    style: TextStyle(color: Colors.white, fontSize: 10.0),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.pink, Colors.redAccent, Colors.orange],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
        ),
        //Todo: Randomise Profile pics
        //Todo: Randomise Network images
        Expanded(
          child: Card(
            margin: EdgeInsets.fromLTRB(8.0, 20.0, 10.0, 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 30.0,
            shadowColor: Colors.blue,
            child: Container(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 50.0, 10.0),
              height: 101.0,
              width: 162.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Top grossing',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Explore top grossing books',
                    style: TextStyle(color: Colors.white, fontSize: 10.0),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.purple,
                      Colors.deepPurple,
                      Colors.blueAccent
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
        ),
      ],
    );
  }
}
