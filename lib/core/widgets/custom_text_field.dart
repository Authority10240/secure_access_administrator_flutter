import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:secure_access_administrator/core/colors.dart';
import 'package:secure_access_administrator/core/sizes.dart';
import 'package:secure_access_administrator/core/text_styles.dart';
class CustomTextField<BaseBloc,BaseState> extends StatelessWidget {
  CustomTextField({
    this.readOnly,
    super.key,
    required this.controller,
    this.onTap,
    this.prefixIcon,
    required this.labelText,
    this.suffixIcon,
    this.width,
    this.enable,
     this.validator,
    this.obscure,
     this.onChanged});
  bool? enable = true;
  bool? obscure = false;
  final TextEditingController controller;
  final Widget? prefixIcon ;
  final Widget? suffixIcon;
  final String labelText;
  final double? width;
   Function(String)? onChanged;
  final String? Function(String?)?  validator;
  final Function()? onTap;
  final bool? readOnly;


  @override
  Widget build(BuildContext context) {
    return Center(

      child: TextFormField(
        onChanged:  onChanged,
        onTap:()=> onTap!= null ?onTap!():null,
        enabled: enable ,
        validator: this.validator ,
        style: textStyleLabel(),
        obscureText: obscure?? false,
        controller: controller,
        readOnly: readOnly?? false,
        decoration:  InputDecoration(
          hintStyle: TextStyle(color: Colors.grey[400] ),
          suffixIcon: SizedBox(
              height: 15,
              child: suffixIcon) ,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColorScheme.boarderBlue,
                  width: 1),
              borderRadius:  BorderRadius.all(Radius.circular(borderRadius)) ),
          hintText: labelText,


        ),

      ),
    );
  }
}

class CustomMultiLineTextField<BaseBloc,BaseState> extends StatelessWidget {
  CustomMultiLineTextField({
    this.maxLines,
    super.key,
    required this.controller,
    this.prefixIcon,
    required this.labelText,
    this.suffixIcon,
    this.width,
    this.enable,
    required this.validator,
    this.obscure});
  bool? enable = true;
  bool? obscure = false;
  final TextEditingController controller;
  final Widget? prefixIcon ;
  final Widget? suffixIcon;
  final String labelText;
  final double? width;
  final String? Function(String?)  validator;
  int? maxLines = 1;

  @override
  Widget build(BuildContext context) {
    return Center(

      child: TextFormField(
        maxLines: maxLines,
        enabled: enable ,
        validator: this.validator ,
        style: textStyleLabel(),
        controller: controller,
        decoration:  InputDecoration(
          hintStyle: TextStyle(color: Colors.grey[400] ),
          suffixIcon: SizedBox(
              height: 15,
              child: suffixIcon) ,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColorScheme.boarderBlue ,
                  width: 1),
              borderRadius:  BorderRadius.all(Radius.circular(borderRadius)) ),
          hintText: labelText,


        ),

      ),
    );
  }
}

class CustomSearchField<BaseBloc,BaseState> extends StatelessWidget {
  CustomSearchField({

    super.key,
    required this.controller,
    this.prefixIcon,
    required this.labelText,
    this.suffixIcon,
    this.width,
    this.enable,
    required this.validator,
    this.obscure, required this.onChanged});
  bool? enable = true;
  bool? obscure = false;
  final TextEditingController controller;
  final Widget? prefixIcon ;
  final Widget? suffixIcon;
  final String labelText;
  final double? width;
  final String? Function(String?)  validator;
  final String? Function(String?) onChanged;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        onChanged: onChanged,
        enabled: enable ,
        style: textStyleLabel(),
        obscureText: obscure?? false,
        controller: controller,
        decoration:  InputDecoration(
          hintStyle: TextStyle(color: Colors.grey[400] ),
          suffixIcon: SizedBox(
              height: 15,
              child: suffixIcon) ,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColorScheme.boarderBlue ,
                  width: 1),
              borderRadius:  BorderRadius.all(Radius.circular(borderRadius)) ),
          hintText: labelText,


        ),

      ),
    );
  }
}

class CustomPhoneField extends StatelessWidget{

  CustomPhoneField({super.key, required this.labelText , required this.phoneController , required this.onChanged});
  final TextEditingController phoneController;
  final Function(String phonenumber) onChanged;
  final String labelText;
  @override
  Widget build(BuildContext context) {


    return IntlPhoneField(
      initialCountryCode:"ZA" ,
      controller:phoneController ,
      decoration:  InputDecoration(
        hintStyle: TextStyle(color: Colors.grey[400] ),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColorScheme.primary ,
                width: 1),
            borderRadius:  BorderRadius.all(Radius.circular(borderRadius)) ),
        hintText: labelText,


      ),
      languageCode: "en",
      onChanged: (phone) =>
          onChanged(phone.completeNumber)
      ,
      onCountryChanged: (country) {
        print('Country changed to: ' + country.name);
      },
    );
  }

}

