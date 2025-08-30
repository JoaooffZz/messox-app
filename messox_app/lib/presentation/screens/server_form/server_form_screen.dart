
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/colors/immutable/server_form.dart';
import '../../components/buttons/button.dart';
import '../../components/animations/fade_text.dart';
import '../../components/ui/form.dart';

class ServerFormScreen extends StatefulWidget {
  const ServerFormScreen({super.key});

  @override
  State<ServerFormScreen> createState() => _ServerFormScreen();
}

class _ServerFormScreen extends State<ServerFormScreen>
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

  bool _ignoring = false;

  @override
  void initState() {
    // fade text
    textFadeControl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));

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
                    SvgPicture.asset(
                      'assets/svgs/server.svg',
                      width: 24, height: 24,
                    ), 
                    'Nome', 
                    true, 
                    keyName, 
                    controlName
                  ),
                  const SizedBox(height: 20),
                  _form(
                    SvgPicture.asset(
                      'assets/svgs/host.svg',
                      width: 24, height: 24,
                    ), 
                    'Host', 
                    true, 
                    keyHost, 
                    controlHost
                  ),
                  const SizedBox(height: 20),
                  _form(
                    SvgPicture.asset(
                      'assets/svgs/schema.svg'
                    ), 
                    'Schema', 
                    true, 
                    keySchema, 
                    controlSchema
                  ),
                  const SizedBox(height: 20),
                  _form(
                    SvgPicture.asset(
                      'assets/svgs/api-key.svg'
                    ), 
                    'Api key', 
                    false, 
                    keyApiKey, 
                    controlApiKey
                  )
                ],
              ),
            ),

            SizedBox(height: heightMQ * 0.12),

            SafeArea(
              child:ButtonCustom(
                ignoring: _ignoring,
                text: 'Connectar',
                shadow: ServerFormColors.shadowButton,
                onTap: () {
                  setState(() {
                    _ignoring = !_ignoring;
                    FocusScope.of(context).unfocus();
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  FormCustom _form(SvgPicture svg, String labelText, bool isRequired,
    GlobalKey<FormState> key, TextEditingController control) {
    return FormCustom(
      formKey: key,
      controller: control,
      svg: svg,
      labelText: labelText,
      background: ServerFormColors.backgroundForm,
      shadow: ServerFormColors.shadowForm,
      ignoring: _ignoring,
      isRequired: isRequired,
    );
  }
}
