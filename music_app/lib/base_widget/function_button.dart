import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/const/color.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';

class BaseFunctionButton extends StatelessWidget {
  const BaseFunctionButton({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, snapshot) => FunctionButton(
            style: Component.buttonPlaySkipPrevious,
            function: () =>
                audioPlayer.hasPrevious ? audioPlayer.seekToPrevious : null,
            icon: Icons.skip_previous_rounded,
            width: 40,
            height: 40,
            borderRadius: Dimen.borderRadiusButtonSmall,
            size: 30,
          ),
        ),
        // FunctionButton(
        //   style: Component.buttonPlaySkipPrevious,
        //   function: () => audioPlayer.seekToPrevious,
        //   width: 40,
        //   height: 40,
        //   size: 30,
        //   icon: Icons.skip_previous_rounded,
        //   borderRadius: Dimen.borderRadiusButtonSmall,
        // ),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (!(playing ?? false)) {
              return FunctionButton(
                style: Component.buttonPlaySkipPrevious,
                function: () => audioPlayer.play,
                height: 60,
                icon: Icons.play_arrow_rounded,
                size: 40,
                width: 60,
                borderRadius: Dimen.borderRadiusFullScreen - 5,
              );
            } else if (processingState != ProcessingState.completed) {
              return FunctionButton(
                style: Component.buttonPlaySkipPrevious,
                function: () => audioPlayer.pause,
                height: 60,
                icon: Icons.pause_rounded,
                size: 40,
                width: 60,
                borderRadius: Dimen.borderRadiusFullScreen,
              );
            }
            return FunctionButton(
              style: Component.buttonPlaySkipPrevious,
              function: () => audioPlayer.play,
              height: 60,
              icon: Icons.play_arrow_rounded,
              size: 40,
              width: 60,
              borderRadius: Dimen.borderRadiusFullScreen,
            );
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, snapshot) => FunctionButton(
            style: Component.buttonPlaySkipPrevious,
            function: () => audioPlayer.hasNext ? audioPlayer.seekToNext : null,
            icon: Icons.skip_next_rounded,
            width: 40,
            height: 40,
            borderRadius: Dimen.borderRadiusButtonSmall,
            size: 30,
          ),
        ),
        // FunctionButton(
        //   style: Component.buttonPlaySkipPrevious,
        //   function: () => audioPlayer.seekToNext,
        //   width: 40,
        //   height: 40,
        //   size: 30,
        //   icon: Icons.skip_next_rounded,
        //   borderRadius: Dimen.borderRadiusButtonSmall,
        // ),
      ],
    );
  }
}

class FunctionButton extends StatelessWidget {
  const FunctionButton({
    super.key,
    required this.style,
    required this.function,
    required this.width,
    required this.height,
    required this.size,
    required this.icon,
    required this.borderRadius,
  });

  final ButtonStyle style;
  final Function function;
  final double width;
  final double height;
  final double size;
  final IconData icon;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: function(),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: ColorConst.colorButton,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
    );
  }
}
