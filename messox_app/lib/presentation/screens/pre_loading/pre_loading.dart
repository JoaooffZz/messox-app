import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:messox_app/presentation/providers/caches/theme.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/immutable/pre_loading.dart';
// import '../../../core/constants/pre_loading/curiosities_fox.dart';
import '../../../core/constants/pre_loading/lottie_fox.dart';
import '../../blocs/pre_loading/bloc.dart';
import '../../blocs/pre_loading/events.dart';
import '../../blocs/pre_loading/state.dart';
import '../../components/animations/staggered_text_animation.dart';
import '../../providers/caches/system.dart';
import '../../routes/pre_loading.dart';
// import 'transparent_loop_animation.dart';

class PreLoading extends StatefulWidget{
  const PreLoading({super.key});

  @override
  State<PreLoading> createState() => _PreLoading();
}

class _PreLoading extends State<PreLoading> with TickerProviderStateMixin{
  bool isLoaded = false;
  List<String> curiositiesFox = [];
  late String lottieFox;

  late final PreLoadingBloc _preLoadBloc;

  @override
  void initState() {
    super.initState();
    _preLoadBloc = PreLoadingBloc();
    Future.microtask(() async {

      await context.read<ProviderCacheSystem>().run();

      lottieFox = LottieFox().get();

      _preLoadBloc.inputEvent.add(
        PreInitSystem(
          settings: context.read<ProviderCacheSystem>().settings!,
          user: context.read<ProviderCacheSystem>().user,
          server: context.read<ProviderCacheSystem>().server,
        )
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    final widthMQ = MediaQuery.of(context).size.width;
    final heightMQ = MediaQuery.of(context).size.height;
    return StreamBuilder<PreLoadingState>(
      stream: _preLoadBloc.outputState,
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state is GoServer) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            RoutesPreLoading.goServer(context);
          });
        }
        if (state is GoAcess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            RoutesPreLoading.goAcess(context);
          });
        }
        if (state is GoHome) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            RoutesPreLoading.goHome(context);
          });
        }

        if (state is Loaded && !isLoaded) {
          isLoaded = true;
          curiositiesFox = state.curiosities;
        }

        if (isLoaded) {
          return body(heightMQ, widthMQ);
        }
        return SizedBox.shrink();
      },
    );
  }

  Widget body(double heightMQ, double widthMQ) {
    return Container(
      decoration: BoxDecoration(
        // color: Color(0xff65ffbb),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: PreLoadingColors.gradiant,
          // colors: [
          //   Color(0xffd2ffeb),
          //   Color(0xff65ffbb),
          // ],
          stops: [0, 0.4],
        ),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: heightMQ * 0.4,
            width: widthMQ * 0.8,
            child: LottieBuilder.asset(
              lottieFox,
              animate: true,
              repeat: true,
            ),
          ),
          StaggeredTextAnimation(
            textStyle: TextStyle(
              color: PreLoadingColors.text,
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
            texts: curiositiesFox,
            duration: Duration(milliseconds: 1200),
          )
        ],
      ),
    );
  }
}