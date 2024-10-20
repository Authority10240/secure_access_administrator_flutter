import 'package:flutter/material.dart';
import 'package:secure_access_administrator/core/colors.dart';
import 'package:secure_access_administrator/core/sizes.dart';
import 'package:secure_access_administrator/core/text_styles.dart';

class CustomFormButton extends StatelessWidget {
  const CustomFormButton({required this.isActive,super.key, required this.onPressed, required this.buttonText});
  final String buttonText;
  final Function onPressed ;
  final bool isActive;


  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColorScheme.primary,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child:TextButton(
          // group923Pb (101:3723)
          onPressed: isActive? ()=>
              onPressed()
              : null,
          child:
          Center(
            child:
            Center(
              child:
              Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: textStyleButton()
              ),
            ),
          ),
        ),

      );
  }
}

Widget customSecondaryButton({required bool isActive, required Function onPressed, required String buttonText}){
  return Container(
    height: 50,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: AppColorScheme.primary)
    ),
    child:TextButton(
      // group923Pb (101:3723)
      onPressed: isActive? ()=>
          onPressed()
          : null,
      child:
      Center(
        child:
        Center(
          child:
          Text(
              buttonText,
              textAlign: TextAlign.center,
              style: textStyleButton()
          ),
        ),
      ),
    ),

  );
}
