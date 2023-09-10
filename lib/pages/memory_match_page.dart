import 'dart:async';
import 'package:flutter/material.dart';
import 'package:matching_card_game/models/game.dart';
import 'package:matching_card_game/widgets/game_button.dart';
import 'package:matching_card_game/widgets/game_timer.dart';
import 'package:matching_card_game/widgets/memory_card.dart';

class MemoryMatchPage extends StatefulWidget {
  const MemoryMatchPage({super.key});

  @override
  State<MemoryMatchPage> createState() => _MemoryMatchPageState();
}

class _MemoryMatchPageState extends State<MemoryMatchPage> {
  Timer? timer;
  Game? game;

  @override
  void initState() {
    super.initState();
    game = Game(4);
    startTimer();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        game!.time = game!.time + 1;
      });

      if (game!.isGameOver) {
        timer!.cancel();
      }
    });
  }

  void _resetGame() {
    game!.resetGame();
    setState(() {
      timer!.cancel();
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory Match'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: GameTimer(
                time: game!.time,
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.count(
                crossAxisCount: game!.gridSize,
                children: List.generate(game!.cards.length, (index) {
                  return MemoryCard(
                    cardItem: game!.cards[index],
                    index: index,
                    oncardPressed: game!.oncardPressed,
                  );
                }),
              ),
            ),
            if (game!.isGameOver)
              Expanded(
                flex: 1,
                child: GameButton(
                  title: 'TRY AGAIN',
                  onPressed: () => _resetGame(),
                ),
              )
            else
              const Expanded(
                flex: 1,
                child: SizedBox(
                  width: 5,
                  height: 5,
                ),
              )
          ],
        ),
      ),
    );
  }
}
