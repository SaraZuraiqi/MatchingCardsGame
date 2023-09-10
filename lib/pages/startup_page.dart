import 'package:flutter/material.dart';
import 'package:matching_card_game/pages/memory_match_page.dart';
import 'package:matching_card_game/widgets/game_button.dart';

class StartUpPage extends StatelessWidget {
  const StartUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Center(
            child: Text(
              'MEMORY MATCH',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          GameButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) {
                return const MemoryMatchPage();
              }));
            },
            title: 'START',
          ),
        ],
      )),
    );
  }
}
