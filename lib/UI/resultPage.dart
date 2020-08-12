import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../conistant.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.title, this.bmi, this.interpretation);

  final String title;
  final String bmi;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MBI APP'),
      ),
      body: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 25.0,
          ),
          Text(
            'Your Result',
            textAlign: TextAlign.center,
            style: numbersStyle,
          ),
          SizedBox(
            height: 15.0,
          ),
          Expanded(child: ContainerOnMiddle(title, bmi, interpretation)),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: double.infinity,
              height: bottomContainerHeight,
              color: bottomContainerColor,
              child: Center(
                child: Text('Re-Calculate'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerOnMiddle extends StatelessWidget {
  ContainerOnMiddle(this.title, this.bmi, this.interpre);

  final String title;
  final String bmi;
  final String interpre;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: normalCardColor,
      ),
      child: Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
//              SizedBox(
//                height: MediaQuery.of(context).size.height / 15,
//              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              ),
              Text(
                title.toUpperCase(),
                style: TextStyle(fontSize: 22.0, color: Colors.green),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              ),
              Text(
                bmi,
                style: TextStyle(
                  fontSize: 44.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              ),
              Text(
                interpre,
                style: labelTextStyle,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
