
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/ui/fade_text.dart';
import '../../components/form_acess.dart';
import '../../components/button_go.dart';

class FormServerScreen extends StatefulWidget {
  const FormServerScreen({super.key});

  @override
  State<FormServerScreen> createState() => _FormServerScreen();
}

class _FormServerScreen extends State<FormServerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController textFadeControl;

  late GlobalKey<FormState> keyName;
  late TextEditingController controlName;

  late GlobalKey<FormState> keyHost;
  late TextEditingController controlHost;

  late GlobalKey<FormState> keySchema;
  late TextEditingController controlSchema;

  late GlobalKey<FormState> keyApiKey;
  late TextEditingController controlApiKey;

  @override
  void initState() {
    // fade text
    textFadeControl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    // form name server
    keyName = GlobalKey<FormState>();
    controlName = TextEditingController();

    // form host server
    keyHost = GlobalKey<FormState>();
    controlHost = TextEditingController();

    // form schema server
    keySchema = GlobalKey<FormState>();
    controlSchema = TextEditingController();

    // form api key
    keyApiKey = GlobalKey<FormState>();
    controlApiKey = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widthMQ = MediaQuery.of(context).size.width;
    final heightMQ = MediaQuery.of(context).size.height;
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      color: const Color(0xff65FFBB),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 25),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: viewInsets),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeSlideText(
                    text: 'Preencha os dados',
                    controller: textFadeControl,
                    textStyle: const TextStyle(
                      color: Color(0xff262527),
                      fontSize: 38,
                      fontFamily: 'RadioCanada',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  FadeSlideText(
                    text: 'do servidor',
                    controller: textFadeControl,
                    textStyle: const TextStyle(
                      color: Color(0xff262527),
                      fontSize: 34,
                      fontFamily: 'RadioCanada',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: heightMQ * 0.12),

            Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _form(
                    heightMQ * 0.08,
                    widthMQ * 0.9,
                    'assets/svgs/server.svg',
                    'Nome *',
                    keyName,
                    controlName,
                  ),
                  const SizedBox(height: 20),
                  _form(
                    heightMQ * 0.08,
                    widthMQ * 0.9,
                    'assets/svgs/host.svg',
                    'Host *',
                    keyHost,
                    controlHost,
                  ),
                  const SizedBox(height: 20),
                  _form(
                    heightMQ * 0.08,
                    widthMQ * 0.9,
                    'assets/svgs/schema.svg',
                    'Schema *',
                    keySchema,
                    controlSchema,
                  ),
                  const SizedBox(height: 20),
                  _form(
                    heightMQ * 0.08,
                    widthMQ * 0.9,
                    'assets/svgs/api-key.svg',
                    'Api-key',
                    keyApiKey,
                    controlApiKey,
                  ),
                ],
              ),
            ),

            SizedBox(height: heightMQ * 0.12),

            SafeArea(
              child: ButtonGo(
                height: heightMQ * 0.07,
                width: widthMQ * 0.5,
                colorBrightBackground: const Color(0xff3C3C3D),
                text: 'Connectar',
                style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xff3C3C3D),
                    fontFamily: 'RadioCanada',
                    fontWeight: FontWeight.w600),
                onTap: () => {},
              ),
            )
          ],
        ),
      ),
    );
  }

  FormAcess _form(double height, double width, String svg, String name,
      GlobalKey<FormState> key, TextEditingController control) {
    return FormAcess(
      height: height,
      width: width,
      formKey: key,
      controller: control,
      svg: SvgPicture.asset(
        svg,
        height: 28,
        width: 28,
      ),
      colorForm: const Color(0xff86868A),
      colorBoxShadow: const Color(0xff444446),
      labelText: name,
      labelStyle: const TextStyle(
        fontSize: 14,
        color: Color(0xffFFFFFF),
        fontFamily: 'RadioCanada',
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
