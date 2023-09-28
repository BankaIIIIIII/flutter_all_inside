import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerPage extends StatefulWidget {
  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late AudioPlayer audioPlayer;
  String currentAsset = 'assets/track1.mp3';
  bool isPlaying = false;

  List<Map<String, dynamic>> tracks = [
    {'title': 'z 1', 'asset': 'assets/z1.mp3'},
    {'title': 'z 2', 'asset': 'assets/z2.mp3'},
    {'title': 'z 3', 'asset': 'assets/z1.mp3'},
  ];

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  Future<void> playAudio(String asset) async {
    await audioPlayer.stop();
    await audioPlayer.setAsset(asset);
    await audioPlayer.play();

    setState(() {
      isPlaying = true;
      currentAsset = asset;
    });
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();

    setState(() {
      isPlaying = false;
    });
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();

    setState(() {
      isPlaying = false;
      currentAsset = 'assets/z1.mp3';
    });
  }

  void previousTrack() {
    int currentIndex =
        tracks.indexWhere((track) => track['asset'] == currentAsset);
    if (currentIndex > 0) {
      playAudio(tracks[currentIndex - 1]['asset']);
    }
  }

  void nextTrack() {
    int currentIndex =
        tracks.indexWhere((track) => track['asset'] == currentAsset);
    if (currentIndex < (tracks.length - 1)) {
      playAudio(tracks[currentIndex + 1]['asset']);
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Audio Player')),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text('Now Playing:', style: TextStyle(fontSize: 20)),
          Text(currentAsset = 'z1.mp3',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous),
                iconSize: 48,
                onPressed: previousTrack,
              ),
              IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                iconSize: 64,
                onPressed:
                    isPlaying ? pauseAudio : () => playAudio(currentAsset),
              ),
              IconButton(
                icon: Icon(Icons.stop),
                iconSize: 48,
                onPressed: stopAudio,
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                iconSize: 48,
                onPressed: nextTrack,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
