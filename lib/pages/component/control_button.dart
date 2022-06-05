import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musickuncie/controller/audio_c.dart';
import 'package:musickuncie/pages/component/slider_dialog.dart';


class ControlButton extends StatelessWidget {
  ControlButton({Key? key}) : super(key: key);
  final cb = Get.find<AudioController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,0,8,20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        color: Colors.brown,
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Opens volume slider dialog
              IconButton(
                icon: const Icon(Icons.volume_up, color: Colors.white,),
                onPressed: () {
                  showSliderDialog(
                    context: context,
                    title: "Adjust volume",
                    divisions: 10,
                    min: 0.0,
                    max: 1.0,
                    value: cb.player.value.volume,
                    stream: cb.player.value.volumeStream,
                    onChanged: cb.player.value.setVolume,
                  );
                },
              ),
              StreamBuilder<PlayerState>(
                stream: cb.player.value.playerStateStream,
                builder: (context, snapshot) {
                  final playerState = snapshot.data;
                  final processingState = playerState?.processingState;
                  final playing = playerState?.playing;
                  if (processingState == ProcessingState.loading ||
                      processingState == ProcessingState.buffering) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      width: 50.0,
                      height: 50.0,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(color: Colors.white,),
                      ),
                    );
                  } else if (playing != true) {
                    return IconButton(
                      icon: const Icon(Icons.play_arrow,color: Colors.white),
                      iconSize: 50.0,
                      onPressed: cb.player.value.play,
                    );
                  } else if (processingState != ProcessingState.completed) {
                    return IconButton(
                      icon: const Icon(Icons.pause,color: Colors.white),
                      iconSize: 50.0,
                      onPressed: cb.player.value.pause,
                    );
                  } else {
                    return IconButton(
                      icon: const Icon(Icons.replay,color: Colors.white),
                      iconSize: 45.0,
                      onPressed: () => cb.player.value.seek(Duration.zero),
                    );
                  }
                },
              ),
              // Opens speed slider dialog
              StreamBuilder<double>(
                stream: cb.player.value.speedStream,
                builder: (context, snapshot) => IconButton(
                  icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  onPressed: () {
                    showSliderDialog(
                      context: context,
                      title: "Adjust speed",
                      divisions: 10,
                      min: 0.5,
                      max: 1.5,
                      value: cb.player.value.speed,
                      stream: cb.player.value.speedStream,
                      onChanged: cb.player.value.setSpeed,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
