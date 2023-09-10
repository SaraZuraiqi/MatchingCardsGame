import 'package:flutter/material.dart';
import 'package:matching_card_game/pages/startup_page.dart';

class TheMemoryGameMatch extends StatelessWidget {
  const TheMemoryGameMatch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const StartUpPage(),
      title: 'The MemoryMatch Game',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}
