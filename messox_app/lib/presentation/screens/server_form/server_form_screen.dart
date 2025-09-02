
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/immutable/server_form.dart';
import '../../../core/colors/mutable/notification_system_error.dart';
import '../../../core/texts/notifications/notifications_texts.dart';
import '../../../core/texts/screens/server_form.dart';
import '../../../server/erros/api.dart';
import '../../blocs/server_form/bloc.dart';
import '../../blocs/server_form/events.dart';
import '../../blocs/server_form/state.dart';
import '../../components/animations/loading.dart';
import '../../components/buttons/button.dart';
import '../../components/animations/fade_text.dart';
import '../../components/ui/form.dart';
import '../../components/ui/notification_api_erros.dart';
import '../../providers/caches/system.dart';
import '../../routes/server_form.dart';

class ServerFormScreen extends StatefulWidget {
  const ServerFormScreen({super.key});

  @override
  State<ServerFormScreen> createState() => _ServerFormScreen();
}

class _ServerFormScreen extends State<ServerFormScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController textFadeControl;
  
  // settings of forms:
  final _focusName = FocusNode();
  late GlobalKey<FormState> keyName;
  late TextEditingController controlName;
  
  final _focusHost = FocusNode();
  late GlobalKey<FormState> keyHost;
  late TextEditingController controlHost;
  
  final _focusScheme = FocusNode();
  late GlobalKey<FormState> keyScheme;
  late TextEditingController controlScheme;
  
  final _focusApiKey = FocusNode();
  late GlobalKey<FormState> keyApiKey;
  late TextEditingController controlApiKey;
  
  // settings notification:  
  late NotificationSystemErrorTheme _notificationTheme;
  late NotificationsTexts _notificationsTexts;
  
  // settings screen:
  late ServerFormTexts _serverFormTexts;
  late final ServerFormBloc _bloc;

  
  // states locale:
  bool _isIgnoring = false;
  bool _isLoading = false;
  late ServerFormState _lastState;

  @override
  void initState() {
    _bloc = ServerFormBloc();

    _serverFormTexts = context.read<SystemCacheProvider>()
      .languageData!.screensTexts.serverFormTexts;

    _notificationsTexts = context.read<SystemCacheProvider>()
      .languageData!.notificationsTexts;

    _notificationTheme = context.read<SystemCacheProvider>()
      .themeData.notificationSystemErrorTheme;

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
    keyScheme = GlobalKey<FormState>();
    controlScheme = TextEditingController();

    // form api key
    keyApiKey = GlobalKey<FormState>();
    controlApiKey = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    textFadeControl.dispose();
    super.dispose();
  }
  
  void _clearFocus() {
    _focusApiKey.unfocus();
    _focusHost.unfocus();
    _focusName.unfocus();
    _focusScheme.unfocus();
  }
  void _ignoring() {
    if(_isIgnoring) _clearFocus();
  }
  void _event() {
    _ignoring();
    _bloc.inputEvent.add(AuthConnection(
      name: controlName.text,
      host: controlHost.text,
      scheme: controlScheme.text,
      apiKey: controlScheme.text,
      upCacheServer: context.read<SystemCacheProvider>().upServer
    ));
  }

  @override
  Widget build(BuildContext context) {
    final heightMQ = MediaQuery.of(context).size.height;
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;

    return StreamBuilder<ServerFormState>(
      stream: _bloc.outputState,
      builder: (context, snapshot) {
        final state = snapshot.data;

        if(state is! Loading && _isLoading) {
          _isLoading = false;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pop(context);
          });
        }
        if(state is Loading && !_isLoading) {
          _isLoading = true; _lastState = state;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            LoadingDialog.show(context);
          });
        }

        if(state is NotAuth && state != _lastState) {
          _lastState = state;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            NotificationApiErros.showNotAuth(
              context, 
              _notificationTheme, 
              _notificationsTexts.notAuthTexts
            );
          });
        }

        if(state is Sucess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            RoutesServerForm.goAcess(context);
          });
        }

        if(state is Error && state != _lastState) {
          _lastState = state;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final error = state.error;
            _ignoring();
            switch(error){
              case RequestError():
                NotificationApiErros.showRequestError(
                  context, _notificationTheme, 
                  _notificationsTexts.requestErrorTexts, 
                  error.code
                );
                break;
              case ConnectionServerError():

              case TimeOutRequestError():
            }
          });
        }

        return _body(viewInsets, heightMQ);
      },
    );
  }

  Widget _body(double viewInsets, double heightMQ) {
    return GestureDetector(
      onTap: _clearFocus,
      child: Container(
        color: ServerFormColors.background,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 25),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: viewInsets),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeSlideText(
                      text: _serverFormTexts.introduction.one,
                      controller: textFadeControl,
                      textStyle: const TextStyle(
                        color: ServerFormColors.textFade,
                        fontSize: 38,
                        fontFamily: 'RadioCanada',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    FadeSlideText(
                      text: _serverFormTexts.introduction.two,
                      controller: textFadeControl,
                      textStyle: const TextStyle(
                        color: ServerFormColors.textFade,
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
                      _serverFormTexts.forms.name, 
                      true, 
                      keyName, 
                      controlName,
                      _focusName
                    ),
                    const SizedBox(height: 20),
                    _form(
                      SvgPicture.asset(
                        'assets/svgs/host.svg',
                        width: 24, height: 24,
                      ), 
                      _serverFormTexts.forms.host, 
                      true, 
                      keyHost, 
                      controlHost,
                      _focusHost
                    ),
                    const SizedBox(height: 20),
                    _form(
                      SvgPicture.asset(
                        'assets/svgs/schema.svg'
                      ), 
                      _serverFormTexts.forms.scheme, 
                      true, 
                      keyScheme, 
                      controlScheme,
                      _focusScheme
                    ),
                    const SizedBox(height: 20),
                    _form(
                      SvgPicture.asset(
                        'assets/svgs/api-key.svg'
                      ), 
                      _serverFormTexts.forms.apiKey, 
                      false, 
                      keyApiKey, 
                      controlApiKey,
                      _focusApiKey
                    )
                  ],
                ),
              ),

              SizedBox(height: heightMQ * 0.12),

              SafeArea(
                child: ButtonCustom(
                  ignoring: _isIgnoring,
                  text: _serverFormTexts.button,
                  shadow: ServerFormColors.shadowButton,
                  onTap: _event,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  FormCustom _form(SvgPicture svg, String labelText, bool isRequired,
    GlobalKey<FormState> key, TextEditingController control, FocusNode focus) {
    return FormCustom(
      formKey: key,
      controller: control,
      focusNode: focus,
      svg: svg,
      labelText: labelText,
      background: ServerFormColors.backgroundForm,
      shadow: ServerFormColors.shadowForm,
      ignoring: _isIgnoring,
      isRequired: isRequired,
    );
  }
}
