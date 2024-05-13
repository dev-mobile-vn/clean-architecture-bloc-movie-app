import 'package:movie_app/common/extensions/text_style_extension.dart';
import 'package:movie_app/common/widgets/image_widget.dart';
import 'package:movie_app/features/movie_detail/data/model/trailer_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoArguments {
  final int index;
  final List<TrailerModel> data;

  WatchVideoArguments({required this.index, required this.data});
}

class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArguments arguments;
  const WatchVideoScreen({super.key, required this.arguments});

  @override
  State<WatchVideoScreen> createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  late YoutubePlayerController _controller;
  late WatchVideoArguments arguments;
  ValueNotifier<String> title = ValueNotifier('');
  List<TrailerModel> listVideo = List.empty();
  @override
  void initState() {
    super.initState();
    arguments = widget.arguments;
    listVideo = arguments.data;
    title.value = listVideo[arguments.index].name;
    _controller = YoutubePlayerController(
        initialVideoId: listVideo[arguments.index].key,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: ValueListenableBuilder<String>(valueListenable: title, builder: (context, title, child) {
          return Text(
            title,
            style: context.titleLarge.copyWith(color: Colors.white),
          );
        }),
      ),
      body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Theme.of(context).primaryColor,
            progressColors: ProgressBarColors(
              playedColor: Theme.of(context).primaryColor,
              handleColor: Theme.of(context).primaryColor.withOpacity(0.3),
            ),
          ),
          builder: (context, player) {
            return Column(
              children: [
                player,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int i = 0; i < listVideo.length; i++)
                          Container(
                            height: 74,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    _controller.load(listVideo[i].key);
                                    _controller.play();
                                    title.value = listVideo[i].name;
                                  },
                                  child: CacheImageWidget(
                                    width: 120,
                                    height: 74,
                                    fit: BoxFit.fill,
                                    imageUrl: YoutubePlayer.getThumbnail(
                                      videoId: listVideo[i].key,
                                      quality: ThumbnailQuality.high,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                      listVideo[i].name,
                                      style: Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
