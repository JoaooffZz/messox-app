import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormAcess extends StatefulWidget{
  const FormAcess({
    super.key,
    required this.height,
    required this.width,
    required this.formKey,
    required this.controller,
    required this.svg,
    required this.colorForm,
    required this.labelText,
    required this.labelStyle,
    required this.colorBoxShadow,
  });
  
  final double height;
  final double width;
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final SvgPicture svg;
  final String labelText;
  final TextStyle labelStyle;
  final Color colorBoxShadow;
  final Color colorForm;
  
  @override
  State<FormAcess> createState() => _FormAcess();
}

class _FormAcess extends State<FormAcess> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.ease,
      height: widget.height,
      width: widget.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xff00F977),
          width: 2
        ),
        color: widget.colorForm,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: widget.colorBoxShadow.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: widget.formKey,
        child: TextFormField(
          controller: widget.controller,
          maxLines: 1,
          textInputAction: TextInputAction.done,
          textAlign: TextAlign.start,
          cursorColor: Colors.white,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'RadiusCanada',
            fontWeight: FontWeight.w400,
            fontSize: 18
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(right: 15),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            labelText: widget.labelText,
            labelStyle: widget.labelStyle,
            prefixIcon: Padding(
              padding: EdgeInsets.all(10),
              child: widget.svg,
            ),
            errorStyle: TextStyle(
              color: Colors.red[400],
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red[400]!, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red[500]!, width: 2.0),
            ),
          ),
        )
      ),
    );
  }
}