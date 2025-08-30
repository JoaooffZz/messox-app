import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messox_app/presentation/components/buttons/button.dart';
import 'package:messox_app/presentation/components/ui/form.dart';

import '../../../core/colors/immutable/acess.dart';
import '../../components/ui/double_toggle_carousel.dart';
import 'animated_weight_text.dart';
import '../../components/animations/fade_text.dart';

class AccessScreen extends StatefulWidget {
  const AccessScreen({super.key});

  @override
  State<AccessScreen> createState() => _AccessScreen();
}

class _AccessScreen extends State<AccessScreen>
    with SingleTickerProviderStateMixin {
  // final colors = ColorsAccessScreen;
  // bool _enabledForm = false;
  bool _isLogin = true;
  bool _ignoring = false;

  late AnimationController textFadeControl;

  late GlobalKey<FormState> keyUser;
  late TextEditingController controlUser;

  late GlobalKey<FormState> keyPassword;
  late TextEditingController controlPassword;

  void _changeAcess() {
    setState(() {
      _isLogin = !_isLogin;
    });
    textFadeControl.forward(from: 0.0);
  }

  @override
  void initState() {
    // fade text
    textFadeControl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));

    // form user
    keyUser = GlobalKey<FormState>();
    controlUser = TextEditingController();
    // form password
    keyPassword = GlobalKey<FormState>();
    controlPassword = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widthMQ = MediaQuery.of(context).size.width;
    final heightMQ = MediaQuery.of(context).size.height;

    return AnimatedContainer(
      padding: EdgeInsets.only(left: 7, right: 7, top: 25),
      duration: const Duration(milliseconds: 600),
      curve: Curves.ease,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _isLogin
              ? [const Color(0xff262626), const Color(0xff1BFF96)]
              : [const Color(0xff00F977), const Color(0xffD2FFEB)],
          stops: _isLogin ? [0.10, 0.65] : [0.05, 0.80],
          begin: _isLogin ? Alignment.topCenter : Alignment.topRight,
          end: _isLogin ? Alignment.bottomCenter : Alignment.bottomLeft,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50),

            DoubleToggleCarousel(
              height: heightMQ * 0.09,
              width: widthMQ * 0.9,
              padding: 8,
              borderRadiusToggle: BorderRadius.circular(15),
              radiusCarousel: 10,
              onEventLeft: _changeAcess,
              onEventRight: _changeAcess,
              colorCarousel: const Color(0xff1BFF96),
              color: const Color(0xffAFAEB2),
              toggleLeft: AnimatedWeightText(
                text: 'Entrar',
                weight: _isLogin ? FontWeight.w600 : FontWeight.w300,
              ),
              toggleRight: AnimatedWeightText(
                text: 'Registrar',
                weight: _isLogin ? FontWeight.w300 : FontWeight.w600,
              ),
            ),

            const SizedBox(height: 30),
            Align(
              alignment: _isLogin? Alignment(-0.4, 0) : Alignment(-0.60, 0),
              child:FadeSlideText(
                text: _isLogin
                    ? 'Bem vindo Usuario'
                    : 'Bem vindo novo\nusuario',
                controller: textFadeControl,
                textStyle: TextStyle(
                  color: _isLogin
                      ? Colors.white
                      : const Color(0xff262527).withOpacity(0.8),
                  fontFamily: 'RadioCanada',
                  fontSize: 38,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: const Alignment(-0.4, 0),
              child: FadeSlideText(
                text: _isLogin
                    ? 'Insira suas credencias de acesso'
                    : 'Crie suas credencias de acesso',
                controller: textFadeControl,
                textStyle: TextStyle(
                  color: _isLogin
                      ? Colors.white
                      : const Color(0xff262527).withOpacity(0.8),
                  fontFamily: 'RadioCanada',
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(height: _isLogin? 60 : 14),

            // forms access
            Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FormCustom(
                    formKey: keyUser, 
                    controller: controlUser, 
                    svg: SvgPicture.asset(
                      _isLogin
                      ? 'assets/svgs/user.svg'
                      : 'assets/svgs/user-add.svg',
                      width: 24, height: 24,
                    ), 
                    labelText: 'Usuario', 
                    background: _isLogin
                      ? AcessColors.backgroundFormLogin
                      : AcessColors.backgroundFormRegister, 
                    shadow: const Color.fromARGB(255, 9, 9, 22), 
                    ignoring: _ignoring, 
                    isRequired: true
                  ),
                  const SizedBox(height: 20),
                  FormCustom(
                    formKey: keyPassword, 
                    controller: controlPassword, 
                    svg: SvgPicture.asset(
                      'assets/svgs/password.svg',
                      width: 24, height: 24,
                    ), 
                    labelText: 'Senha', 
                    background: _isLogin
                      ? AcessColors.backgroundFormLogin
                      : AcessColors.backgroundFormRegister, 
                    shadow: AcessColors.shadowForm, 
                    ignoring: _ignoring, 
                    isRequired: true
                  ),
                ],
              ),
            ),

            SizedBox(height: heightMQ * 0.25),

            TextButton(
              onPressed: () {
                // ação aqui
              },
              style: const ButtonStyle(
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                padding: MaterialStatePropertyAll(EdgeInsets.zero),
                minimumSize: MaterialStatePropertyAll(Size.zero),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                foregroundColor: MaterialStatePropertyAll(Color(0xFF007E42)),
              ),
              child: const Text(
                'alterar servidor',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF007E42),
                ),
              ),
            ),

            const SizedBox(height: 25),

            ButtonCustom(
              shadow: _isLogin
              ? AcessColors.shadowButtonLogin
              : AcessColors.shadowButtonRegister, 
              text: _isLogin
              ? 'Prosseguir'
              : 'Registrar', 
              onTap: () => {}, 
              ignoring: _ignoring
            )
          ],
        ),
      ),
    );
  }
}
