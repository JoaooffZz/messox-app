library ScreenServerForm;

// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:messox_app/core/colors/mutable/notification_system_not_auth.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/mutable/notification_system_error.dart';
import '../../../core/texts/notifications/texts_notification.dart';
import '../../../core/texts/screens/server_form.dart';
import '../../components/animations/loading.dart';
import '../../components/animations/move_fade_in.dart';
import '../../components/buttons/button.dart';
import '../../components/animations/fade_text.dart';
import '../../components/ui/custom_form_field.dart';
import '../../components/ui/notification_api_erros.dart';
import '../../components/ui/notification_not_auth.dart';
import '../../providers/caches/system.dart';
import '../../providers/screens/server_form.dart';
import '../../routes/server_form.dart';

import '../../blocs/server_form/bloc.dart' as bloc;
import '../../../core/colors/immutable/server_form.dart' as colors;
import '../../../core/texts/screens/server_form.dart' as texts;
part './mixins.dart';
class ServerFormScreen extends StatefulWidget {
  const ServerFormScreen({super.key});

  @override
  State<ServerFormScreen> createState() => _ServerFormScreen();
}

class _ServerFormScreen extends State<ServerFormScreen>
    with SingleTickerProviderStateMixin, ValidatorFormMixins {
  
  // settings notification:  
  late NotificationSystemErrorTheme _notificationErrorTheme;
  late NotificationSystemNotAuthTheme _notificationNotAuthTheme;
  late TextsNotifications _notificationsTexts;
  
  // settings screen:
  late Texts _texts;
  late void Function() _ignoring;
  late final bloc.ServerFormBloc _bloc;

  
  // locales:
  bool _isLoading = false;
  bloc.ServerFormState? _lastState;

  late ProviderCacheSystem _providerSystem;

  @override
  void initState() {
    _providerSystem = context.read<ProviderCacheSystem>();
    _bloc = bloc.ServerFormBloc();

    _texts = context.read<ProviderCacheSystem>()
      .languageData!.textsScreens.serverFormTexts;

    _notificationsTexts = context.read<ProviderCacheSystem>()
      .languageData!.textsNotifications;

    _notificationErrorTheme = context.read<ProviderCacheSystem>()
      .themeData.notificationSystemErrorTheme;
    
    _notificationNotAuthTheme = context.read<ProviderCacheSystem>()
      .themeData.notificationSystemNotAuthTheme;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heightMQ = MediaQuery.of(context).size.height;
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;

    return StreamBuilder<bloc.ServerFormState>(
      stream: _bloc.outputState,
      builder: (context, snapshot) {
        final state = snapshot.data;
        
        if(state is bloc.Loading && !_isLoading) {
          _isLoading = true; _lastState = state;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            LoadingDialog.show(context);
          });
        }
        if(state is! bloc.Loading && _isLoading) {
          _isLoading = false;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pop(context);
          });
        }

        if(state is bloc.Sucess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            RoutesServerForm.goAcess(context);
          });
        }

        if(state is bloc.ApiExceptions && state != _lastState) {
          _lastState = state; _ignoring();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            NotificationsApiErrors.show(context, 
              _notificationErrorTheme, 
              _notificationsTexts, 
              state.error
            );
          });
        }

        return ChangeNotifierProvider(
          create: (context) {
            final provider = ProviderServerForm();
            provider.init(this, 
              _providerSystem
                .languageData!
                .textsScreens
                .serverFormTexts,
              _bloc.inputEvent.add);
            _ignoring = provider.ignoring;
            return provider;
          },
          builder: (context, child){
            return _content(viewInsets, heightMQ);
          },
        );
      },
    );
  }

  Widget _content(double viewInsets, double heightMQ) {
    return Consumer<ProviderServerForm>(
      builder: (context, provider, _) {
        return GestureDetector(
          onTap: provider.clearFocus,
          child: Container(
            color: colors.background,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 25),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: viewInsets),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                    ),
                    child:DefaultTextStyle(
                      style: TextStyle(
                        color: colors.textInfo,
                        fontFamily: 'RadioCanada',
                        fontWeight: FontWeight.w700,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MoveFadeIn(
                            delay: Duration(milliseconds: 400),
                            child: Text(
                              provider.texts.introduction.one,
                              style: TextStyle(fontSize: 38), // sobrescreve só o tamanho
                            ),
                          ),
                          MoveFadeIn(
                            delay: Duration(milliseconds: 450),
                            child: Text(
                              provider.texts.introduction.two,
                              style: TextStyle(fontSize: 36), // sobrescreve só o tamanho
                            ),
                          ),
                        ],
                      ),
                    )
                  ),

                  SizedBox(height: heightMQ * 0.12),
                  _forms(provider),
                  SizedBox(height: heightMQ * 0.12),

                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom,
                    ),
                    child: ButtonCustom(
                      ignoring: provider.isIgnoring,
                      text: provider.texts.button,
                      shadow: colors.shadowButton,
                      onTap: provider.event,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Material _forms(ProviderServerForm provider) {
    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Form Name
          MoveFadeIn(
            delay: const Duration(milliseconds: 500),
            child: Form(
              key: provider.keyName,
              child: CustomTextFormField(
                controller: provider.controlName,
                focusNode: provider.focusName,
                svg: SvgPicture.asset(
                  'assets/svgs/server.svg',
                  width: 24,
                  height: 24,
                ),
                labelText: _texts.forms.name,
                background: colors.backgroundForm,
                shadow: colors.shadowForm,
                ignoring: provider.isIgnoring,
                isRequired: true,
                validator: nameValidator(_texts.mixins.name),
                inputFormatters: provider.inputName,
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Form Host
          MoveFadeIn(
            delay: const Duration(milliseconds: 600),
            child: Form(
              key: provider.keyHost,
              child: CustomTextFormField(
                controller: provider.controlHost,
                focusNode: provider.focusHost,
                svg: SvgPicture.asset(
                  'assets/svgs/host.svg',
                  width: 24,
                  height: 24,
                ),
                labelText: _texts.forms.host,
                background: colors.backgroundForm,
                shadow: colors.shadowForm,
                ignoring: provider.isIgnoring,
                isRequired: true,
                validator: hostValidator(_texts.mixins.host),
                inputFormatters: provider.inputHost,
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Form Scheme
          MoveFadeIn(
            delay: const Duration(milliseconds: 700),
            child: Form(
              key: provider.keyScheme,
              child: CustomTextFormField(
                controller: provider.controlScheme,
                focusNode: provider.focusScheme,
                svg: SvgPicture.asset(
                  'assets/svgs/schema.svg',
                  width: 24,
                  height: 24,
                ),
                labelText: _texts.forms.scheme,
                background: colors.backgroundForm,
                shadow: colors.shadowForm,
                ignoring: provider.isIgnoring,
                isRequired: true,
                validator: schemeValidator(_texts.mixins.scheme),
                inputFormatters: provider.inputScheme,
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Form API Key
          MoveFadeIn(
            delay: const Duration(milliseconds: 800),
            child: Form(
              key: provider.keyApiKey,
              child: CustomTextFormField(
                controller: provider.controlApiKey,
                focusNode: provider.focusApiKey,
                svg: SvgPicture.asset(
                  'assets/svgs/api-key.svg',
                  width: 24,
                  height: 24,
                ),
                labelText: _texts.forms.apiKey,
                background: colors.backgroundForm,
                shadow: colors.shadowForm,
                ignoring: provider.isIgnoring,
                isRequired: false,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
