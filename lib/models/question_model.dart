import 'package:flutter/material.dart';

class QuestionModel {
  final String question;
  final List<String> answers;
  final String correctAnswer;
  final List icon;

  QuestionModel({
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.icon
  });
}

List<QuestionModel> questionsWithAnswers = [
    QuestionModel(
      question: 'What\'s your favorite color?',
      answers: ['Red', 'Blue', 'Yellow', 'Black'],
      correctAnswer: 'Red',
     icon:[Container(width: 20,height: 20,decoration: BoxDecoration(color: Colors.red,shape: BoxShape.circle),),Container(width: 20,height: 20,decoration: BoxDecoration(color: Colors.blue,shape: BoxShape.circle),),Container(width: 20,height: 20,decoration: BoxDecoration(color: Colors.yellow,shape: BoxShape.circle),),Container(width: 20,height: 20,decoration: BoxDecoration(color: Colors.black,shape: BoxShape.circle),),],
    ),
    QuestionModel(
      question: 'What\'s the correct direction?',
      answers: ['North', 'East', 'South', 'West'],
      correctAnswer: 'East',
      icon: [Icon(Icons.north),Icon(Icons.east),Icon(Icons.south),Icon(Icons.west),]
    ),
    QuestionModel(
      question: 'What\'s your favorite app?',
      answers: ['Facebook', 'Tiktok', 'Telegram', 'Discord'],
      correctAnswer: 'Telegram',
      icon: [Icon(Icons.facebook,color: Colors.blue,),Container(child: Icon(Icons.tiktok,color: Colors.white,),decoration: BoxDecoration(color: Colors.black,shape: BoxShape.circle),),Icon(Icons.telegram,color: Colors.blue,),Container(child: Icon(Icons.discord_sharp,color: Colors.white,),decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.blue),padding: EdgeInsets.all(3),),]    ),
    QuestionModel(
      question: 'What\'s your favorite transport?',
      answers: ['Bike', 'Car', 'Motorcycle', 'Train'],
      correctAnswer: 'Car',
      icon: [Icon(Icons.pedal_bike),Icon(Icons.car_rental),Icon(Icons.motorcycle_outlined),Icon(Icons.train),]

    ),
  ];