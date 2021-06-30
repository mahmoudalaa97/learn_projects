import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_projects/ui/quiz/quiz_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Center(
                      child: SvgPicture.asset("assets/ic_intro.svg"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 31),
                    child: Text(
                      "Do You Want To "
                      "Know Your Score for Flutter Experience 👨‍💻 ?",
                      style:
                          textStyle(fontSize: 29, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    "By answering these questions, we can help you to show your experience on the flutter framework.",
                    style: textStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 200,
                  height: 75,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20))))),
                    onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizScreen(),))
                    ,
                    child: Text(
                      "Start Quiz",
                      style: textStyle(fontSize: 28, fontWeight: FontWeight.w500).copyWith(color: Colors.white),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  TextStyle textStyle(
      {required double fontSize, required FontWeight fontWeight}) {
    return TextStyle(
        fontSize: fontSize, fontWeight: fontWeight, color: Color(0xff113960));
  }
}
