import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormCustom extends StatefulWidget {
  const FormCustom({
    super.key,
    required this.formKey,
    required this.controller,
    required this.focusNode,
    required this.svg,
    required this.labelText,
    required this.background,
    required this.shadow,
    required this.ignoring,
    required this.isRequired
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final FocusNode focusNode;
  final SvgPicture svg;
  final String labelText;
  final Color background;
  final Color shadow;
  final bool ignoring;
  final bool isRequired;

  @override
  State<FormCustom> createState() => _FormAcess();
}

class _FormAcess extends State<FormCustom> {
   
  @override
  Widget build(BuildContext context) {

    // aplica transparência se ignoring = true
    final Color background = widget.ignoring
        ? widget.background.withOpacity(0.7)
        : widget.background;

    final Color shadow = widget.ignoring
        ? widget.shadow.withOpacity(0.2)
        : widget.shadow;
    
    final Color required = widget.ignoring
        ? Color(0xfffe6b72).withOpacity(0.5)
        : Color(0xfffe6b72);

    final Color borderColor = widget.ignoring
        ? const Color(0xff00F977).withOpacity(0.7)
        : const Color(0xff00F977);

    final Color labelColor = widget.ignoring
        ? const Color(0xffFFFFFF).withOpacity(0.7)
        : const Color(0xffFFFFFF);

    final Color textColor = widget.ignoring
        ? Colors.white.withOpacity(0.7)
        : Colors.white;

    final Color cursorColor = widget.ignoring
        ? Colors.white.withOpacity(0.7)
        : Colors.white;

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
        children: [
          Form(
            key: widget.formKey,
            child: TextFormField(
              showCursor: !widget.ignoring,
              controller: widget.controller,
              focusNode: widget.focusNode,
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
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(right: 15),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
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
            ),
          ),
          if (widget.ignoring)
            Positioned.fill(
              child: IgnorePointer(
                ignoring: false, // bloqueia interação
                child: Container(color: Colors.transparent),
              ),
            ),
          if(widget.isRequired)
            Positioned(
              top: -5,
              right: 10,
              child: Text(
                '*',
                style: TextStyle(
                  color: required,
                  fontFamily: 'RadioCanada',
                  fontWeight: FontWeight.w400,
                  fontSize: 18
                ),
              )
            )
        ],
      ),
    );
  }
}
