import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/lottie_fox.dart';
import '../../blocs/pre_loading/pre_loading_bloc.dart';
import '../../blocs/pre_loading/pre_loading_events.dart';
import '../../blocs/pre_loading/pre_loading_state.dart';
import '../../providers/caches/system_cache_provider.dart';
import '../../routes/pre_loading.dart';
import 'transparent_loop_animation.dart';

class PreLoading extends StatefulWidget{
  const PreLoading({super.key});

  @override
  State<PreLoading> createState() => _PreLoading();
}

class _PreLoading extends State<PreLoading> with TickerProviderStateMixin{
  bool isLoaded = false;
  
  late final String Function() curiositiesFoxGet;
  String curiosityFox = '';
  late String lottieFox;

  late AnimationController _controller;
  void _setupAnimationController() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse(); // vai para trás
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward(); // vai para frente
        // curiosityFox = curiositiesFoxGet();
        setState(() {
          curiosityFox = curiositiesFoxGet();
        });
      }
    });

    _controller.forward();
  }

  late final PreLoadingBloc _preLoadBloc;

  @override
  void initState() {
    super.initState();
    _preLoadBloc = PreLoadingBloc();
    Future.microtask(() async {
      await context.read<SystemCacheProvider>().run();

      lottieFox = LottieFox().get();
      _setupAnimationController();

      _preLoadBloc.inputEvent.add(
        PreInitSystem(system: context.read<SystemCacheProvider>().system)
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
          curiositiesFoxGet = state.curiositiesFoxGet;
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
        color: Color(0xff65ffbb),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffd2ffeb),
            Color(0xff65ffbb),
          ],
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
          TransparentLoopAnimation(
            controller: _controller,
            height: heightMQ * 0.12,
            width: widthMQ * 0.8,
            duration: const Duration(seconds: 1),
            child: DefaultTextStyle(
              style: TextStyle(
                fontFamily: 'RadioCanada',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff3c3b3f).withOpacity(0.8),
              ), 
              child: Text(curiosityFox),
            ),
          ),
        ],
      ),
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}