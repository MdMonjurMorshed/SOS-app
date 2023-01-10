import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VidPlayer extends StatefulWidget {
  const VidPlayer({super.key, required this.vidId});
  final String vidId;

  @override
  State<VidPlayer> createState() => _VidPlayerState();
}

class _VidPlayerState extends State<VidPlayer> {
  YoutubePlayerController? _ypc;

  @override
  void initState() {
    // TODO: implement initState

    _ypc = YoutubePlayerController(
        flags: YoutubePlayerFlags(autoPlay: true),
        initialVideoId: widget.vidId);
    super.initState();
  }

  @override
  void dispose() {
    _ypc!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: _ypc!),
      builder: (context, player) => Scaffold(
        body: player,
      ),
    );
  }
}
