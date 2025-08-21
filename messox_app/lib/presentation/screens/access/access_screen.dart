import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import '../../../core/colors/colors_acess_screen.dart';
import '../../components/double_toggle_carousel.dart';
import 'animated_weight_text.dart';
import '../../components/ui/fade_text.dart';
import '../../components/button_go.dart';
import '../../components/form_acess.dart';

class AccessScreen extends StatefulWidget {
  const AccessScreen({super.key});

  @override
  State<AccessScreen> createState() => _AccessScreen();
}

class _AccessScreen extends State<AccessScreen>
    with SingleTickerProviderStateMixin {
  // final colors = ColorsAccessScreen;
  bool _isLogin = true;

  late AnimationController textFadeControl;

  late GlobalKey<FormState> formKeyUser;
  late TextEditingController formUsercontrol;

  late GlobalKey<FormState> formKeyPassword;
  late TextEditingController formPasswordcontrol;

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
    formKeyUser = GlobalKey<FormState>();
    formUsercontrol = TextEditingController();
    // form password
    formKeyPassword = GlobalKey<FormState>();
    formPasswordcontrol = TextEditingController();

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
                  FormAcess(
                    height: heightMQ * 0.08,
                    width: widthMQ * 0.9,
                    formKey: formKeyUser,
                    controller: formUsercontrol,
                    svg: SvgPicture.asset(
                      _isLogin
                          ? 'assets/svgs/user.svg'
                          : 'assets/svgs/user-add.svg',
                      height: 28,
                      width: 28,
                    ),
                    colorForm: _isLogin
                        ? const Color(0xff797780)
                        : const Color(0xff5C5B5F),
                    colorBoxShadow: const Color(0xff444446),
                    labelText: 'Usuario',
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
                    formKey: formKeyPassword,
                    controller: formPasswordcontrol,
                    svg: SvgPicture.asset(
                      'assets/svgs/password.svg',
                      height: 28,
                      width: 28,
                    ),
                    colorForm: _isLogin
                        ? const Color(0xff797780)
                        : const Color(0xff5C5B5F),
                    colorBoxShadow: const Color(0xff444446),
                    labelText: 'Senha',
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: 'RadioCanada',
                      fontWeight: FontWeight.w600,
                    ),
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

            ButtonGo(
              height: heightMQ * 0.07,
              width: widthMQ * 0.5,
              colorBrightBackground: _isLogin
                  ? const Color(0xff444446).withOpacity(0.5)
                  : const Color(0xff262527).withOpacity(0.5),
              text: _isLogin ? 'Prosseguir' : 'Registrar',
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xff3C3C3D),
                fontFamily: 'RadioCanada',
                fontWeight: FontWeight.w600,
              ),
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
