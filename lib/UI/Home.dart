import 'package:bmiapp/Calculator.dart';
import 'package:bmiapp/UI/resultPage.dart';
import 'package:bmiapp/conistant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'resultPage.dart';

enum Gender { male, female }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender genderSelected;
  int heightHigh = 170;
  int weightValue = 60;
  int ageValue = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        genderSelected = Gender.male;
                      });
                    },
                    clickColor: genderSelected == Gender.male
                        ? normalCardColor
                        : clickedCardColor,
                    cardChild: CardOnContainer(
                        cardIcon: Icon(
                          FontAwesomeIcons.male,
                        ),
                        label: 'Male'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        genderSelected = Gender.female;
                      });
                    },
                    clickColor: genderSelected == Gender.female
                        ? normalCardColor
                        : clickedCardColor,
                    cardChild: CardOnContainer(
                        cardIcon: Icon(FontAwesomeIcons.female),
                        label: 'Female'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              clickColor: normalCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: labelTextStyle,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        heightHigh.toString(),
                        style: numbersStyle,
                      ),
                      Text(
                        ' cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: bottomContainerColor,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 11.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      min: 120,
                      max: 220,
                      activeColor: bottomContainerColor,
                      inactiveColor: Color(0xFF8D8E98),
                      value: heightHigh.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          heightHigh = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    clickColor: normalCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: labelTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '$weightValue',
                          style: numbersStyle,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              childIcon: Icon(FontAwesomeIcons.minus),
                              onPPressed: () {
                                setState(() {
                                  weightValue--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                            RoundIconButton(
                              childIcon: Icon(FontAwesomeIcons.plus),
                              onPPressed: () {
                                setState(() {
                                  weightValue++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    clickColor: normalCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: labelTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '$ageValue',
                          style: numbersStyle,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              childIcon: Icon(FontAwesomeIcons.minus),
                              onPPressed: () {
                                setState(() {
                                  ageValue--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                            RoundIconButton(
                              childIcon: Icon(FontAwesomeIcons.plus),
                              onPPressed: () {
                                setState(() {
                                  ageValue++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculator calc =
                  Calculator(weightValue: weightValue, heightValue: heightHigh);
              String title, bmiResult, interpretation;
              bmiResult = calc.calculateBMI();
              title = calc.getTitle();
              interpretation = calc.getInterpretation();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ResultPage(title, bmiResult, interpretation),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: bottomContainerHeight,
              color: bottomContainerColor,
              child: Center(
                child: Text('Calculate'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.clickColor, this.cardChild, this.onPressed});

  final Color clickColor;
  final Widget cardChild;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: clickColor,
        ),
        child: cardChild,
      ),
    );
  }
}

class CardOnContainer extends StatelessWidget {
  final Widget cardIcon;
  final String label;

  CardOnContainer({@required this.cardIcon, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        cardIcon,
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.childIcon, @required this.onPPressed});
  final Widget childIcon;
  final Function onPPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Center(child: childIcon),
      shape: CircleBorder(),
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor: clickedCardColor,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 38.0,
        height: 44.0,
      ),
      onPressed: onPPressed,
    );
  }
}
