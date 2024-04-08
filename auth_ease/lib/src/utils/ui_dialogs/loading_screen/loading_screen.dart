import 'dart:async' show StreamController;
import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/extensions/decorate_text.dart';
import 'package:auth_ease/src/utils/ui_dialogs/loading_screen/loading_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class LoadingScreen{
  LoadingScreen._sharedInstance();
  static final LoadingScreen _shared = LoadingScreen._sharedInstance();
  factory LoadingScreen() => _shared;
  
  LoadingScreenController? controller;

  void showOverlay({
    required BuildContext context,
    required String text
  }){
    if(controller?.updateScreen(text) ?? false){
      return;
    } else{
      controller = _showOverlay(context, text);
    }
  }

  void hideOverlay() {
    controller?.closeScreen();
    controller = null;
  }

  LoadingScreenController? _showOverlay(
    BuildContext context, String text
  ){
    final state = Overlay.of(context);
    if(!state.mounted){
      return null;
    }

    final textStream = StreamController<String>();
    textStream.sink.add(text);

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    
    final overlay = OverlayEntry(
      builder: (_) => Material(
        color: blackColor.withAlpha(50),
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: size.width * 0.8,
              maxHeight: size.height * 0.8,
              minWidth: size.width * 0.5
            ),
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Gap(10),
                    const CircularProgressIndicator(
                      color: whiteColor
                    ),
                    const Gap(20),
                    StreamBuilder(
                      stream: textStream.stream,
                      builder: (_, snapshot){
                        if(snapshot.hasData){
                          return Text(snapshot.data!).decorateText(
                            color: whiteColor,
                            fontWeight: fontWeight6,
                            fontSize: fontSize2half
                          );
                        } else{
                          return const SizedBox.shrink();
                        }
                      }
                    )
                  ],
                ),
              ),
            ),
          )
        )
      )
    );
    state.insert(overlay);
    return LoadingScreenController(
      closeScreen: (){
        textStream.close();
        overlay.remove();
        return true;
      },
      updateScreen: (text){
        textStream.sink.add(text);
        return true;
      }
    );
  }
}