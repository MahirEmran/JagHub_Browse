import 'package:flutter/material.dart';
import 'package:flutter_survey/flutter_survey.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'recommend_event.dart';

class FindEventQuizPage extends StatefulWidget {
  FindEventQuizPage({
    Key? key,
  }) : super(key: key);

  @override
  _FindEventQuizPageState createState() => _FindEventQuizPageState();
}

class _FindEventQuizPageState extends State<FindEventQuizPage> {
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(mainAxisSize: MainAxisSize.max, children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 30, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        'Find an Event',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * .95,
                  height: MediaQuery.of(context).size.height * .75,
                  color: Colors.white,
                  child: Form(
                    key: _formKey,
                    child: Survey(
                      onNext: (questionResults) {
                        print(questionResults);
                        //store the result
                      },
                      initialData: [
                        Question(
                          question:
                              "Do you enjoy attending ASB-related events?",
                          singleChoice: true,
                          answerChoices: {
                            "Yes": null,
                            "No": null,
                          },
                          isMandatory: true,
                        ),
                        Question(
                          question: "Do you like more large scale events?",
                          singleChoice: true,
                          answerChoices: {
                            "Yes": null,
                            "No": null,
                          },
                          isMandatory: true,
                        ),
                        Question(
                          question: "Do you prefer more competitive events?",
                          singleChoice: true,
                          answerChoices: {
                            "Yes": null,
                            "No": null,
                          },
                          isMandatory: true,
                        ),
                        Question(
                          question:
                              "Are you interested in just hanging out with friends?",
                          singleChoice: true,
                          answerChoices: {
                            "Yes": null,
                            "No": null,
                          },
                          isMandatory: true,
                        ),
                        Question(
                          question:
                              "Do you want a place to talk about your interests?",
                          singleChoice: true,
                          answerChoices: {
                            "Yes": null,
                            "No": null,
                          },
                          isMandatory: true,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => RecommendEventPage(),
                            ),
                          );
                        } else {
                          Fluttertoast.showToast(
                            msg:
                                "Please fill out all fields before submitting.",
                            toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                          );
                        }
                      },
                      child: Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                              child: Text("Submit\nAnswers",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
