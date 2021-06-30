import 'package:flutter/material.dart';
import 'package:learn_projects/models/questions_model.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionIndex=0;
  int totalScore=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5638FF),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Question ${questionIndex+1} / ${questions.length}",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: StepProgressIndicator(
                  totalSteps: questions.length,
                  currentStep: questionIndex,
                  size: 15,
                  padding: 0,
                  selectedColor: Color(0xffFCB23F),
                  unselectedColor: Colors.white.withOpacity(0.44),
                  roundedEdges: Radius.circular(10),
                ),
              ),
              QuizCardItem(
                question: "${questions[questionIndex].question}",
                answer: questions[questionIndex].answer,
                onPress:(){
                  print("Click $questionIndex");
                  if(questionIndex<questions.length-1) {
                    print(questionIndex);
                    setState(() {
                      questionIndex++;
                    });
                  }else{
                    showDialog(context: context, builder: (context) => AboutDialog(children: [
                      Text("Score")
                    ],),);
                  }
                },

              )
            ],
          ),
        ),
      ),
    );
  }
}

class QuizCardItem extends StatelessWidget {
  final String? question;
  final List<Answer>? answer;
  final VoidCallback? onPress;
  const QuizCardItem({
    Key? key, this.question, this.answer, this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(vertical: 25,horizontal: 25),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "$question",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff113960)),
              ),
              SizedBox(height: 50,),
              ListView.builder(
                itemCount: answer?.length,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    Item(value: "${answer![index].text}",onPress: onPress,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Item extends StatefulWidget {
  final String value;
  final VoidCallback? onPress;

  const Item({Key? key, required this.value, this.onPress}) : super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap:  widget.onPress,
      child: Container(
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: EdgeInsets.only(bottom: 20),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.5)),
        child: Text(
          "${widget.value}",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xff113960)),
        ),
      ),
    );
  }
}
