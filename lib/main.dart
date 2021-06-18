import 'package:flutter/material.dart';
import 'package:quizzler/Question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  List<Question> questionList = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true)
  ];
  int questionNum = 0;
  int correctAnsNum = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionNum > questionList.length - 1
                    ? questionList[0].question
                    : questionList[questionNum].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(
                    color: Colors.greenAccent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              //color: color,
              width: double.infinity,
              child: TextButton(
                child: Text(
                  'True',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (questionNum <= questionList.length - 1) {
                      if (questionList[questionNum].answer == true) {
                        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                        correctAnsNum++;
                      } else {
                        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                      }
                      questionNum++;
                    } else {
                      int score =
                          (correctAnsNum * 100 / questionList.length).round();
                      print(
                          'You have reached end of the quiz. Your Score: $score%');
                      Alert(
                        context: context,
                        title: "Alert!",
                        desc:
                            "You have reached end of the quiz. Your Score: $score%",
                      ).show();
                      scoreKeeper = [];
                      questionNum = 0;
                      correctAnsNum = 0;
                    }
                  });
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(
                    color: Colors.redAccent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              //color: color,
              width: double.infinity,
              child: TextButton(
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (questionNum <= questionList.length - 1) {
                      if (questionList[questionNum].answer == false) {
                        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                        correctAnsNum++;
                      } else {
                        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                      }
                      questionNum++;
                    } else {
                      int score =
                          (correctAnsNum * 100 / questionList.length).round();
                      print(
                          'You have reached end of the quiz. Your Score: $score%');
                      Alert(
                        context: context,
                        title: "Alert!",
                        desc:
                            "You have reached end of the quiz. Your Score: $score%",
                      ).show();
                      scoreKeeper = [];
                      questionNum = 0;
                      correctAnsNum = 0;
                    }
                  });
                },
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
