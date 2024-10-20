import 'package:flutter/material.dart';

import 'colors.dart';

TextStyle textStyleTitle(){
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    color: AppColorScheme.primary
  );
}

TextStyle textStyleHeading(){
  return  TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: AppColorScheme.primary
  );
}

TextStyle textStyleSubHeading(){
  return  TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: AppColorScheme.primary
  );
}

TextStyle textStyleDirectives(){
  return  TextStyle(

      fontSize: 14,
      color: AppColorScheme.primary
  );
}

TextStyle textStyleDescription(){
  return  TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      color: AppColorScheme.primary
  );
}

TextStyle textStyleParagraph(){
  return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 10,
      color: AppColorScheme.baseTextColor
  );
}

TextStyle textStyleLabel(){
  return  TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      color: AppColorScheme.baseTextColor
  );
}

 TextStyle textStyleButton ()=> TextStyle(
  fontSize:  16,
  fontWeight:  FontWeight.w500,
  color:  AppColorScheme.active,
);

TextStyle textStyleHint(){
  return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 8,
      color: AppColorScheme.descriptionColor
  );
}

 TextStyle textStyleFinePrintUnderlined ()=>  TextStyle(
    fontSize: 12,
    decoration: TextDecoration.underline,
     color: AppColorScheme.primary
);