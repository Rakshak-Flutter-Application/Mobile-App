import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/color.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/physics.dart';

class EarthquakeSafetyGame extends StatefulWidget {
  @override
  _EarthquakeSafetyGameState createState() => _EarthquakeSafetyGameState();
}

class _EarthquakeSafetyGameState extends State<EarthquakeSafetyGame> {
  String message = '';
  bool gameOver = false;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: GameScreen()),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  String message = '';
  bool gameOver = false;
  var heading = '';
  var image = '';
  var choice_images = [
    "assets/hiding-under-a-table.jpg",
    "assets/run-away-earthquake.jpg",
    "assets/stay-in-bed-eathquake.jpg"
  ];
  String? result;

  void makeChoice(int choice) {
    setState(() {
      switch (choice) {
        case 1:
          heading = "Hide under table";
          image = "assets/hiding-under-a-table.jpg";
          message =
              'You panic and rush outside, but a power line falls nearby, nearly electrocuting you. You realize that running outside during an earthquake can be dangerous.';
          result = "win";
          gameOver = true;
          _animationController.forward();
          break;
        case 2:
          heading = "Run outside";
          image = "assets/run-away-earthquake.jpg";
          message =
              'You remember to hide under a sturdy table. Debris falls around you, but the table shields you. When the shaking stops, you crawl out safely. This choice shows that "Drop, Cover, and Hold On" is vital during earthquakes.';
          result = "lose";
          gameOver = true;
          _animationController.forward();
          break;
        case 3:
          heading = "Stay in bed";
          image = "assets/stay-in-bed-eathquake.jpg";
          message =
              'You stay in bed, thinking it\'s safe. But then the ceiling fan falls, narrowly missing you. You\'re trapped until rescuers arrive. This teaches us that staying in bed during an earthquake is risky.';
          result = "lose";
          gameOver = true;
          _animationController.forward();
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    var textStyle = theme.textTheme;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(size.width * .05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (!gameOver)
              Column(
                children: [
                  Text(
                    'An earthquake is shaking your home. What will you do?',
                    textAlign: TextAlign.center,
                    style: textStyle.headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.width * .05,
                  ),
                  Image.asset(
                    'assets/earthquake.png',
                    width: size.width * .6,
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () => makeChoice(1),
                    child: ChoiceTile(
                        choice: "Hide under table",
                        size: size,
                        image: choice_images[0],
                        gameOver: gameOver,
                        message: message,
                        textStyle: textStyle),
                  ),
                  SizedBox(
                    height: size.width * .05,
                  ),
                  InkWell(
                    onTap: () => makeChoice(2),
                    child: ChoiceTile(
                        choice: "Run outside",
                        reverse: true,
                        size: size,
                        image: choice_images[1],
                        gameOver: gameOver,
                        message: message,
                        textStyle: textStyle),
                  ),
                  SizedBox(
                    height: size.width * .05,
                  ),
                  InkWell(
                    onTap: () => makeChoice(3),
                    child: ChoiceTile(
                        choice: "Stay in bed",
                        size: size,
                        image: choice_images[2],
                        gameOver: gameOver,
                        message: message,
                        textStyle: textStyle),
                  ),
                ],
              ),
            if (gameOver)
              AnimatedContainer(
                duration: Duration(seconds: 5), // Adjust the duration as needed
                curve: Curves.fastLinearToSlowEaseIn,
                child: Visibility(
                  visible: gameOver,
                  child: AnimatedBuilder(
                    animation: _fadeAnimation,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _fadeAnimation.value,
                        child: child,
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.generalColor,
                              borderRadius:
                                  BorderRadius.circular(size.width * .1)),
                          margin: EdgeInsets.only(top: size.width * .05),
                          padding: EdgeInsets.all(size.width * .05),
                          height: size.height * .8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: Text(
                                  heading,
                                  style: textStyle.displayLarge!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Image.asset(result == "win"
                                  ? "assets/win.gif"
                                  : "assets/game-over.gif"),
                              Flexible(
                                child: Text(
                                  message,
                                  textAlign: TextAlign.center,
                                  style: textStyle.bodyLarge!.copyWith(
                                      color: Colors.black,
                                      fontSize: size.width * .05),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                gameOver = false;
                                _animationController.forward();
                              });
                            },
                            child: const CircleAvatar(
                                backgroundColor: AppColors.generalColor,
                                child: Icon(Icons.replay_rounded)),
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
  }
}

class ChoiceTile extends StatelessWidget {
  ChoiceTile({
    super.key,
    required this.size,
    required this.image,
    required this.gameOver,
    required this.message,
    required this.choice,
    required this.textStyle,
    this.reverse,
  });

  final Size size;
  final String image;
  final bool gameOver;
  final String message;
  final String choice;
  final TextTheme textStyle;
  bool? reverse = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .9,
      padding: EdgeInsets.all(size.width * .02),
      decoration: BoxDecoration(
          color: AppColors.generalColor,
          borderRadius: BorderRadius.circular(size.width * .05)),
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
