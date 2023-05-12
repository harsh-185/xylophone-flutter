import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  int sound = 1;
  Color b_color = Colors.red;

  void playSound(int sound) {
    AudioPlayer player = AudioPlayer();
    player.play(AssetSource('note$sound.wav'));
  }

  Expanded buildKey(int sound,Color b_color) {
    return Expanded(
      child: FilledButton(
        onPressed: () {
          playSound(sound);
        },
        style: sharedButtonStyle.copyWith(
          backgroundColor: MaterialStateProperty.all(b_color),
        ),
      ),
    );
  }

  final sharedButtonStyle = ButtonStyle(
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                buildKey(1, Colors.red),
                buildKey(2, Colors.orange),
                buildKey(3, Colors.yellow),
                buildKey(4, Colors.green),
                buildKey(5, Colors.teal),
                buildKey(6, Colors.blue),
                buildKey(7, Colors.blue[900]),
            ]
          ),
        )
      ),
    );
  }
}