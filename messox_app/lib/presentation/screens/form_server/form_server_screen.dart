
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/fade_text.dart';
import '../../widgets/form_acess.dart';
import '../../widgets/button_go.dart';

class FormServerScreen extends StatefulWidget{
  const FormServerScreen({super.key});

  @override
  State<FormServerScreen> createState() => _FormServerScreen();
}

class _FormServerScreen extends State<FormServerScreen> with SingleTickerProviderStateMixin{
  late AnimationController textFadeControl;

  late GlobalKey<FormState> formKeyNameServ;
  late TextEditingController formNameServControl;

  late GlobalKey<FormState> formKeyHostServ;
  late TextEditingController formHostServControl;

  late GlobalKey<FormState> formKeySchemaServ;
  late TextEditingController formSchemaServControl;

  @override
  void initState() {
    // fade text
    textFadeControl = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 700)
    );

    // form name server
    formKeyNameServ = GlobalKey<FormState>();
    formNameServControl = TextEditingController();

    // form host server
    formKeyHostServ = GlobalKey<FormState>();
    formHostServControl = TextEditingController();

    // form host server
    formKeySchemaServ = GlobalKey<FormState>();
    formSchemaServControl = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widthMQ = MediaQuery.of(context).size.width;
    final heightMQ = MediaQuery.of(context).size.height;
    return Container(
      color: Color(0xff65FFBB),
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 7, right: 7, top: 25),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeSlideText(
              text: 'Preencha os dados', 
              controller: textFadeControl, 
              textStyle: TextStyle(
                color: Color(0xff262527),
                fontSize: 38,
                fontFamily: 'RadioCanada',
                fontWeight: FontWeight.w700
              )
            ),
            Align(
              alignment: Alignment(-0.73, 0),
              child:FadeSlideText(
                text: 'do servidor', 
                controller: textFadeControl, 
                textStyle: TextStyle(
                  color: Color(0xff262527),
                  fontSize: 32,
                  fontFamily: 'RadioCanada',
                  fontWeight: FontWeight.w700
                )
              )
            ),

            SizedBox(height: heightMQ * 0.15),

            Material(
              color: Colors.transparent, // Material transparente
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  FormAcess(
                    height: heightMQ * 0.08,
                    width: widthMQ * 0.9,
                    formKey: formKeyNameServ,
                    controller: formNameServControl,
                    svg: SvgPicture.asset(
                      'assets/svgs/server.svg',
                      height: 28,
                      width: 28,
                    ),
                    colorForm: const Color(0xff86868A),
                    colorBoxShadow: const Color(0xff444446),
                    labelText: 'Nome',
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xffFFFFFF),
                      fontFamily: 'RadioCanada',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FormAcess(
                    height: heightMQ * 0.08,
                    width: widthMQ * 0.9,
                    formKey: formKeyHostServ,
                    controller: formHostServControl,
                    svg: SvgPicture.asset(
                      'assets/svgs/host.svg',
                      height: 28,
                      width: 28,
                    ),
                    colorForm: const Color(0xff86868A),
                    colorBoxShadow: const Color(0xff444446),
                    labelText: 'Host',
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xffFFFFFF),
                      fontFamily: 'RadioCanada',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FormAcess(
                    height: heightMQ * 0.08,
                    width: widthMQ * 0.9,
                    formKey: formKeySchemaServ,
                    controller: formSchemaServControl,
                    svg: SvgPicture.asset(
                      'assets/svgs/schema.svg',
                      height: 28,
                      width: 28,
                    ),
                    colorForm: const Color(0xff86868A),
                    colorBoxShadow: const Color(0xff444446),
                    labelText: 'Schema',
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xffFFFFFF),
                      fontFamily: 'RadioCanada',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: heightMQ * 0.25),

            ButtonGo(
              height: heightMQ * 0.07,
              width: widthMQ * 0.5,
              colorBrightBackground: Color(0xff3C3C3D),
              text: 'Connectar',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff3C3C3D),
                fontFamily: 'RadioCanada',
                fontWeight: FontWeight.w600
              ),
              onTap: () => {},
            )
          ],
        ),
      ),
    );
  }
}