import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/pages/score_page.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int questionIndex = 0;
  bool showScore = false;
  int score = 0;
  String? selectedAnswer;
  List<String> sA = [];
  final snackBar = SnackBar(
    content: const Text('Please Choose An Option!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {},
    ),
  );
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: !showScore
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      questionsWithAnswers[questionIndex].question,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Answer and get points!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Question " + (questionIndex + 1).toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' of ' + (questionsWithAnswers.length).toString(),
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: (((MediaQuery.of(context).size.width - 48) /
                                  questionsWithAnswers.length) *
                              (questionIndex + 1))
                          .toDouble(),
                      height: 2,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: questionsWithAnswers[questionIndex]
                          .answers
                          .map(
                            (answer) => Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedAnswer = answer;
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: answer == selectedAnswer
                                        ? Colors.green
                                        : null,
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(0.3),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      questionsWithAnswers[questionIndex].icon[
                                          questionsWithAnswers[questionIndex]
                                              .answers
                                              .indexOf(answer)],
                                      const SizedBox(width: 16),
                                      Text(
                                        answer,
                                        style: TextStyle(
                                          color: answer == selectedAnswer
                                              ? Colors.white
                                              : null,
                                          fontWeight: answer == selectedAnswer
                                              ? FontWeight.bold
                                              : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedAnswer != null) {
                            sA.add(selectedAnswer!);
                            if (selectedAnswer ==
                                questionsWithAnswers[questionIndex]
                                    .correctAnswer) {
                              
                              setState(() {
                                score++;
                              });
                            } 
                            if (questionIndex <
                                questionsWithAnswers.length - 1) {
                              setState(() {
                                questionIndex++;
                              });
                            } else {
                              setState(() {
                                showScore = true;
                              });
                            }
                            setState(() {
                              selectedAnswer = null;
                            });
                            debugPrint('Index: $questionIndex');
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            // Show a snackbar => Task 1
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Next'),
                      ),
                    ),
                  ],
                )
              : ScorePage(
                  score: score,
                  
                  sa:sA,
                  onTap: () {
                    setState(() {
                      questionIndex = 0;
                      sA = [];
                      score = 0;
                      showScore = false;
                      selectedAnswer = null;
                    });
                  },
                ),
        ),
      ),
    );
  }
}
