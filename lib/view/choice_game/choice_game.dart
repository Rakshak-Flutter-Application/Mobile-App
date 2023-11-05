import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rakshak_sos/res/color.dart';

class GameModel extends ChangeNotifier {
  String message = '';
  bool gameOver = false;
  var heading = '';
  var image = '';
  var choiceImages = [
    "assets/hiding-under-a-table.jpg",
    "assets/run-away-earthquake.jpg",
    "assets/stay-in-bed-eathquake.jpg"
  ];
  String? result;

  void makeChoice(int choice) {
    switch (choice) {
      case 1:
        heading = "Hide under table";
        image = "assets/hiding-under-a-table.jpg";
        message =
            'You remember to hide under a sturdy table. Debris falls around you, but the table shields you. When the shaking stops, you crawl out safely. This choice shows that "Drop, Cover, and Hold On" is vital during earthquakes.';
        result = "lose";
        gameOver = true;
        break;
      case 2:
        heading = "Run outside";
        image = "assets/run-away-earthquake.jpg";
        message =
            'You panic and rush outside, but a power line falls nearby, nearly electrocuting you. You realize that running outside during an earthquake can be dangerous.';
        result = "win";
        gameOver = true;
        break;
      case 3:
        heading = "Stay in bed";
        image = "assets/stay-in-bed-eathquake.jpg";
        message =
            "You stay in bed, thinking it's safe. But then the ceiling fan falls, narrowly missing you. You're trapped until rescuers arrive. This teaches us that staying in bed during an earthquake is risky.";
        result = "lose";
        gameOver = true;
        break;
    }
    notifyListeners();
  }

  void resetGame() {
    heading = '';
    image = '';
    message = '';
    result = null;
    gameOver = false;
    notifyListeners();
  }
}

class EarthquakeSafetyGame extends StatefulWidget {
  const EarthquakeSafetyGame({super.key});

  @override
  State<EarthquakeSafetyGame> createState() => _EarthquakeSafetyGameState();
}

class _EarthquakeSafetyGameState extends State<EarthquakeSafetyGame> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(158, 169, 255, 1.0),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (_) => GameModel(),
          child: Consumer<GameModel>(
            builder: (context, gameModel, child) {
              return Center(
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * .05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      if (!gameModel.gameOver)
                        Column(
                          children: [
                            Text(
                                'An earthquake is shaking your home. What will you do?',
                                textAlign: TextAlign.center,
                                style: textStyle.headlineSmall!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: size.width * .05,
                            ),
                            Image.asset(
                              'assets/earthquake.png',
                              width: size.width * .6,
                            ),
                            SizedBox(height: size.height * .02),
                            InkWell(
                              onTap: () => gameModel.makeChoice(1),
                              child: ChoiceTile(
                                choice: "Hide under table",
                                size: MediaQuery.of(context).size,
                                image: gameModel.choiceImages[0],
                                gameOver: gameModel.gameOver,
                                message: gameModel.message,
                              ),
                            ),
                            SizedBox(
                              height: size.width * .02,
                            ),
                            InkWell(
                              onTap: () => gameModel.makeChoice(2),
                              child: ChoiceTile(
                                choice: "Run outside",
                                reverse: true,
                                size: MediaQuery.of(context).size,
                                image: gameModel.choiceImages[1],
                                gameOver: gameModel.gameOver,
                                message: gameModel.message,
                              ),
                            ),
                            SizedBox(
                              height: size.width * .02,
                            ),
                            InkWell(
                              onTap: () => gameModel.makeChoice(3),
                              child: ChoiceTile(
                                choice: "Stay in bed",
                                size: MediaQuery.of(context).size,
                                image: gameModel.choiceImages[2],
                                gameOver: gameModel.gameOver,
                                message: gameModel.message,
                              ),
                            ),
                          ],
                        ),
                      if (gameModel.gameOver)
                        AnimatedContainer(
                          duration: const Duration(seconds: 5),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Visibility(
                            visible: gameModel.gameOver,
                            child: AnimatedBuilder(
                              animation: gameModel,
                              builder: (context, child) {
                                return Opacity(
                                  opacity: gameModel.gameOver ? 1.0 : 0.0,
                                  child: child,
                                );
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors
                                          .generalColor, // Change color as needed
                                      borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width * .1,
                                      ),
                                    ),
                                    margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.width *
                                          .05,
                                    ),
                                    padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * .05,
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height * .8,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          gameModel.heading,
                                          style: textStyle.displayLarge!
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                        Image.asset(gameModel.result == "win"
                                            ? "assets/win.gif"
                                            : "assets/game-over.gif"),
                                        Flexible(
                                          child: Text(
                                            gameModel.message,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .05,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: InkWell(
                                      onTap: () {
                                        gameModel.resetGame();
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: AppColors
                                            .bgColor, // Change color as needed
                                        child: Icon(
                                          Icons.replay_rounded,
                                          color: AppColors.generalColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ChoiceTile extends StatelessWidget {
  const ChoiceTile({
    super.key,
    required this.size,
    required this.image,
    required this.gameOver,
    required this.message,
    required this.choice,
    this.reverse,
  });

  final Size size;
  final String image;
  final bool gameOver;
  final String message;
  final String choice;
  final bool? reverse;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme;
    return Container(
      width: size.width * .9,
      padding: EdgeInsets.all(size.width * .02),
      decoration: BoxDecoration(
        color: AppColors.generalColor,
        borderRadius: BorderRadius.circular(size.width * .05),
      ),
      height: size.height * .15,
      child: reverse == true
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    choice,
                    style:
                        textStyle.displayLarge!.copyWith(color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: size.width * .05,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(size.width * .03),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(size.width * .03),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: size.width * .05,
                ),
                Flexible(
                  child: Text(
                    choice,
                    style:
                        textStyle.displayLarge!.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
    );
  }
}
