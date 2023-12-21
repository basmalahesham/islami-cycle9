import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/model/RadioModel.dart';
import 'package:islami/moduls/radio/radio_service.dart';

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  final player = AudioPlayer();
  int index = 0;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: FutureBuilder<RadioModel>(
        future: getRadio(),
        builder: (context, snapshot) {
          var data = snapshot.data?.radios ?? [];
          return Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Image.asset('assets/images/radio_image.png'),
              SizedBox(
                height: 25,
              ),
              if (data != null &&
                  data.isNotEmpty &&
                  index <
                      data.length) // Check if data is not null and not empty
                Column(
                  children: [
                    Text(
                      data[index].name ?? 'إذاعة القرآن الكريم',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (index > 0) {
                              index--;
                              player.stop();
                              player.play(UrlSource(data[index].url ?? ''));
                              setState(() {});
                            }
                          },
                          icon: Icon(
                            Icons.skip_previous,
                            size: 40,
                            color: theme.canvasColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            player.stop();
                            if (!isPlaying) {
                              player.play(UrlSource(data[index].url ?? ''));
                            }
                            //player.play(UrlSource(data[index].url ?? ''));
                            isPlaying = !isPlaying;
                            setState(() {});
                          },
                          icon: Icon(
                            isPlaying ? Icons.stop : Icons.play_arrow,
                            //Icons.play_arrow,
                            size: 40,
                            color: theme.canvasColor,
                          ),
                        ),
                        /*IconButton(
                onPressed: () {
                  player.stop();
                  isPlaying = false;
                  setState(() {

                  });
                },
                icon: Icon(
                  Icons.stop,
                  size: 40,
                  color: theme.canvasColor,
                ),
              ),*/
                        IconButton(
                          onPressed: () {
                            if (index < data.length - 1) {
                              // Check if index is within the valid range
                              index++;
                              player.stop();
                              player.play(UrlSource(data[index].url ?? ''));
                              setState(() {});
                            }
                          },
                          icon: Icon(
                            Icons.skip_next,
                            size: 40,
                            color: theme.canvasColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
/*
Column(
children: [
SizedBox(
height: 150,
),
Image.asset('assets/images/radio_image.png'),
SizedBox(
height: 25,
),
Text(
data[index].name ?? 'إذاعة القرآن الكريم',
style: TextStyle(
fontSize: 25,
fontWeight: FontWeight.w600,
),
),
SizedBox(
height: 25,
),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
IconButton(
onPressed: () {
if (index > 0) {
index--;
player.stop();
player.play(UrlSource(data[index].url ?? ''));
setState(() {});
}
},
icon: Icon(
Icons.skip_previous,
size: 40,
color: theme.canvasColor,
),
),
IconButton(
onPressed: () {
player.stop();
if (!isPlaying) {
player.play(UrlSource(data[index].url ?? ''));
}
//player.play(UrlSource(data[index].url ?? ''));
isPlaying = !isPlaying;
setState(() {});
},
icon: Icon(
isPlaying ? Icons.stop : Icons.play_arrow,
//Icons.play_arrow,
size: 40,
color: theme.canvasColor,
),
),
*/
/*IconButton(
                    onPressed: () {
                      player.stop();
                      isPlaying = false;
                      setState(() {

                      });
                    },
                    icon: Icon(
                      Icons.stop,
                      size: 40,
                      color: theme.canvasColor,
                    ),
                  ),*/ /*

IconButton(
onPressed: () {
if (index < data.length) {
index++;
player.stop();
player.play(UrlSource(data[index].url ?? ''));
setState(() {});
}
},
icon: Icon(
Icons.skip_next,
size: 40,
color: theme.canvasColor,
),
),
],
),
],
)*/
