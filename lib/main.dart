import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

final soundList = [
  "C.wav",
  "D.wav",
  "E.wav",
  "F.wav",
  "G.wav",
  "A.wav",
  "B.wav",
];

Timer? crushTimer;

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("audio_players_sample"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  var audioCache = AudioCache();
                  crushTimer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
                    final idx = Random().nextInt(soundList.length);
                    audioCache.play(soundList[idx]);
                  });
                }, 
                child: const Text("play crush sound")
            ),
            ElevatedButton(
                onPressed: () {
                  crushTimer?.cancel();
                },
                child: const Text("stop crush sound")
            ),
            ElevatedButton(onPressed: () {}, child: const Text("play no crush sound")),
            ElevatedButton(onPressed: () {}, child: const Text("stop no crush sound")),
          ],
        ),
      ),
    );
  }
}
