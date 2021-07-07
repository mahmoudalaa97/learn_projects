import 'package:flutter/material.dart';
import 'package:learn_projects/utils/colors.dart';
import 'package:learn_projects/utils/style.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  CustomButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 45,
      width: size.width,
      child: MaterialButton(
        onPressed: onPressed,
        color: MyColors.agateBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          "$title",
          style: MyStyle.textStyle(
            fontSize: 15,
            color: MyColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
