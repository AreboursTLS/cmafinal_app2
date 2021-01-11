import 'package:cmafinal_app/widgets/cmabottombar.dart';
import 'package:flutter/material.dart';
import 'package:cmafinal_app/widgets/shapedwidgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';


class VideosScreen extends StatefulWidget {

  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {



  YoutubePlayerController controller1 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId('https://youtu.be/GIZ-40oJYAE'),
    flags: YoutubePlayerFlags(
      enableCaption: false,
      isLive: false,
      autoPlay: false,
      mute: false,
    ));

  YoutubePlayerController controller2 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId('https://youtu.be/ANp8EkB5X4k'),
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
        mute: false,
      ));

  YoutubePlayerController controller3 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId('https://youtu.be/6k2b-21HqC4'),
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
        mute: false,
      ));



  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }




  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: CmaBottomBar(),
      body: SafeArea(
        child: Column(
          children: [
            TopBarWidget(onPress: (){Navigator.pop(context);}, label1: 'Les', label2: 'Vidéos', label3:'du CMA' ,),
            SizedBox(
              height: 30,
            ),
          Expanded(
            child: ListView(
              children: [ YoutubePlayer(controller: controller1,
                width: double.infinity,
              ),
                SizedBox(
                  height: 20,
                ),
                YoutubePlayer(controller: controller2,
                  width: double.infinity,
                ),

              SizedBox(
                height: 20,
              ),
                YoutubePlayer(controller: controller3,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 20,
                ),],),
          ),
          ],
        ),
      ),

    );
  }
}
