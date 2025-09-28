import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.validator,
    required this.focusNode,
    required this.svg,
    required this.labelText,
    required this.background,
    required this.shadow,
    required this.ignoring,
    required this.isRequired,
    this.inputFormatters = null,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode focusNode;
  final SvgPicture svg;
  final String labelText;
  final Color background;
  final Color shadow;
  final bool ignoring;
  final bool isRequired;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isError = false;
  String err = "";
  late Color background;
  late Color shadow;
  late Color requiredColor;
  late Color borderColor;
  late Color labelColor;
  late Color textColor;
  late Color cursorColor;

  void _setError(String e) {
    shadow = const Color(0xffFE6B72);
    borderColor = const Color(0xffFF0000);
    err = e;
    setState(() {
      _isError = true;
    });
  }

  void _upError() {
    shadow = widget.shadow;
    borderColor = const Color(0xff00F977);
    err = "";
    setState(() {
      _isError = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _setColors();
  }
  void _setColors() {
    background = widget.ignoring
        ? widget.background.withOpacity(0.7)
        : widget.background;

    shadow = widget.ignoring 
        ? widget.shadow.withOpacity(0.2) 
        : widget.shadow;

    requiredColor = widget.ignoring
        ? const Color(0xfffe6b72).withOpacity(0.5)
        : const Color(0xffFF0800);

    borderColor = widget.ignoring 
        ? const Color(0xff00F977).withOpacity(0.7) 
        : const Color(0xff00F977);

    labelColor = widget.ignoring ? Colors.white.withOpacity(0.7) : Colors.white;

    textColor = widget.ignoring ? Colors.white.withOpacity(0.7) : Colors.white;

    cursorColor = widget.ignoring ? Colors.white.withOpacity(0.7) : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    if(!_isError) _setColors();
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.decelerate,
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.9,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        color: background,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: shadow,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          FormField<String>(
            initialValue: widget.controller.text,
            validator: (val) {
              if (widget.validator == null) return null;
              final e = widget.validator!(val);
              if (e != null) {
                _setError(e);
                return ''; // mantém inválido no Form, mas sem erro visual do Flutter
              }
              if (_isError) _upError();
              return null;
            },
            builder: (state) {
              return TextField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                showCursor: !widget.ignoring,
                maxLines: 1,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.start,
                cursorColor: cursorColor,
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'RadiusCanada',
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
                inputFormatters: widget.inputFormatters,
                onChanged: (val) {
                  state.didChange(val); // integra com o Form
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(right: 15),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  labelText: widget.labelText,
                  labelStyle: TextStyle(
                    fontSize: 14,
                    color: labelColor,
                    fontFamily: 'RadioCanada',
                    fontWeight: FontWeight.w600,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: widget.svg,
                  ),
                  errorStyle:
                      const TextStyle(height: 0, color: Colors.transparent),
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              );
            },
          ),
          if (widget.ignoring)
            Positioned.fill(
              child: IgnorePointer(
                ignoring: false,
                child: Container(color: Colors.transparent),
              ),
            ),
          if (widget.isRequired)
            Positioned(
              top: -5,
              right: 10,
              child: Text(
                '*',
                style: TextStyle(
                  color: requiredColor,
                  fontFamily: 'RadioCanada',
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ),
          if (_isError)
            TweenAnimationBuilder<Offset>(
              tween: Tween<Offset>(
                begin: const Offset(0, -20),
                end: const Offset(0, -32),
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              builder: (context, offset, child) {
                return Transform.translate(
                  offset: offset,
                  child: child,
                );
              },
              child: Text(
                err,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xffE60026),
                  fontSize: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
