// To parse this JSON data, do
//
//     final questionsModel = questionsModelFromJson(jsonString);

import 'dart:convert';

QuestionsModel questionsModelFromJson(String str) =>
    QuestionsModel.fromJson(json.decode(str));

String questionsModelToJson(QuestionsModel data) => json.encode(data.toJson());

class QuestionsModel {
  QuestionsModel({
    this.questions,
  });

  final List<Question>? questions;

  QuestionsModel copyWith({
    List<Question>? questions,
  }) =>
      QuestionsModel(
        questions: questions ?? this.questions,
      );

  factory QuestionsModel.fromJson(Map<String, dynamic> json) => QuestionsModel(
        questions: json["questions"] == null
            ? null
            : List<Question>.from(
                json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "questions": questions == null
            ? null
            : List<dynamic>.from(questions!.map((x) => x.toJson())),
      };
}

class Question {
  Question({
    this.question,
    this.answer,
  });

  final String? question;
  final List<Answer>? answer;

  Question copyWith({
    String? question,
    List<Answer>? answer,
  }) =>
      Question(
        question: question ?? this.question,
        answer: answer ?? this.answer,
      );

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json["question"] == null ? null : json["question"],
        answer: json["answer"] == null
            ? null
            : List<Answer>.from(json["answer"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "question": question == null ? null : question,
        "answer": answer == null
            ? null
            : List<dynamic>.from(answer!.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    this.text,
    this.score,
  });

  final String? text;
  final int? score;

  Answer copyWith({
    String? text,
    int? score,
  }) =>
      Answer(
        text: text ?? this.text,
        score: score ?? this.score,
      );

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        text: json["text"] == null ? null : json["text"],
        score: json["score"] == null ? null : json["score"],
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "score": score == null ? null : score,
      };
}

List<Question> questions = [
  Question(question: "What is Favorite Subject?", answer: [
    Answer(
      text: "Math",
      score: 4,
    ),
    Answer(
      text: "Chemistry",
      score: 3,
    ),
    Answer(
      text: "Computer",
      score: 5,
    ),
    Answer(
      text: "Physics",
      score: 2,
    ),
  ]),
  Question(question: "Test", answer: [
    Answer(
      text: "Ahmed",
      score: 5,
    ),
    Answer(
      text: "Mahmoud",
      score: 10,
    ),
    Answer(
      text: "Ali",
      score: 4,
    ),
    Answer(
      text: "Khaled",
      score: 3,
    ),
  ]),
  Question(question: "Test2", answer: [
    Answer(
      text: "A",
      score: 1,
    ),
    Answer(
      text: "B",
      score: 9,
    ),
    Answer(
      text: "C",
      score: 8,
    ),
    Answer(
      text: "D",
      score: 5,
    ),
  ])
];
