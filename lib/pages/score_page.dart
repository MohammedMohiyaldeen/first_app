import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';

class ScorePage extends StatefulWidget {
  final int score;
  final void Function()? onTap;
  
  final List<String> sa;

  const ScorePage({
    super.key,
    required this.score,
    required this.onTap,
    
    required this.sa,
  });

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int index = 1;
  List<int> indexo=[0,1,2,3];
  @override
  Widget build(BuildContext context) {
    index = 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Quiz Completed!',
                  style: TextStyle(fontSize: 35),
                ),
                Icon(
                  widget.score > 2
                      ? Icons.sentiment_satisfied_alt_outlined
                      : Icons.sentiment_dissatisfied_outlined,
                  color: widget.score > 2 ? Colors.green : Colors.red,
                  size: 40,
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  widget.score > 2 ? "Sucess!" : "Failed!",
                  style: TextStyle(
                    fontSize: 20,
                    color: widget.score > 2 ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Score: ${widget.score}/${questionsWithAnswers.length}',
                  style: TextStyle(
                      color: widget.score > 2 ? Colors.green : Colors.red,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Details : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: indexo
                      .map((e) => GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    backgroundColor: Colors.green,

                                  content: Text(
                                      ' Your Answer : ${(widget.sa[e]).toString()}   ,Correct answer: ${(questionsWithAnswers[e].correctAnswer).toString()}',style: TextStyle(fontWeight: FontWeight.bold),),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {},
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: widget.sa[e] == questionsWithAnswers[e].correctAnswer
                                          ? Colors.green
                                          : Colors.red),
                                  child: Center(
                                      child: Text(
                                    (e+1).toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )),
                          ))
                      .toList()),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: widget.onTap,
                child: const Text('Reset'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
