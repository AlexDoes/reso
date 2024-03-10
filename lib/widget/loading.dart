import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CharactersStackAnimation extends StatelessWidget {
  const CharactersStackAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xfffaf2a3),
              // Color.fromARGB(255, 248, 239, 239),
              Color(0xffffca6f)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CharactersStack(
              characters: [
                "assets/images/mascotshadow.png",
                "assets/images/coffeecup.png",
                // "assets/images/plasticbag.png",
                // "assets/images/toiletpaper.png",
                // "assets/images/chips.png",
                "assets/images/milkcarton.png",
                "assets/images/waterbottle.png",
                "assets/images/sodacan.png",
                "assets/images/newspaper.png",
              ],
            ),
            Text('Collecting waste to recycle!',
                style: Theme.of(context).textTheme.headlineMedium),
            Text('Please help us reduce waste!',
                style: Theme.of(context).textTheme.headlineMedium),
            Text('Recycle when you can!',
                style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}

class CharactersStack extends StatelessWidget {
  const CharactersStack({
    super.key,
    required this.characters,
    this.stackHeight = 500,
  });

  final List<String> characters;
  final double stackHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: stackHeight,
      child: Stack(
        children: List.generate(
          characters.length,
          (index) {
            if (index == 0) {
              // print('index: $index');
              return Align(
                alignment: Alignment.center,
                child: Transform.translate(
                  offset: const Offset(0, 0),
                  child: Characters(imageUrl: characters[index])
                      .animate(
                        delay: const Duration(milliseconds: 500),
                      )
                      .fadeIn(
                        delay: Duration(milliseconds: index * 800),
                      )
                      .slideY(
                        begin: -1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: index * 800),
                      )
                      .animate()
                      .shimmer(
                        duration: 2400.ms,
                      ),
                ),
              );
            } else {
              // Layer for other Characterss, placed behind the first one
              return Align(
                alignment: Alignment.center,
                child: Transform.translate(
                  offset: const Offset(0, 0),
                  child: Characters(imageUrl: characters[index])
                      .animate(
                        delay: const Duration(milliseconds: 500),
                      )
                      .fadeIn(
                        delay: Duration(milliseconds: index * 800),
                      )
                      .slideY(
                        begin: -1,
                        end: -.2,
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: index * 800),
                      )
                      .fadeOut(
                        duration: 1500.ms,
                        delay: Duration(milliseconds: index * 700),
                      )
                      .animate()
                      .shimmer(
                        duration: 2400.ms,
                      ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class Characters extends StatelessWidget {
  const Characters({
    super.key,
    required this.imageUrl,
    this.radius = 500,
    this.child,
  });

  final String imageUrl;
  final int radius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // return CircleCharacters(
    //   radius: radius.toDouble() + 2,
    //   backgroundColor: Colors.white,
    //   child: CircleCharacters(
    //     radius: radius.toDouble(),
    //     backgroundImage: AssetImage(imageUrl),
    //     child: child,
    //   ),
    // );
    if (imageUrl == "assets/images/mascotshadow.png") {
      return Image(image: AssetImage(imageUrl), width: 500, height: 500);
    } else {
      return Image(image: AssetImage(imageUrl), width: 300, height: 300);
    }
  }
}
