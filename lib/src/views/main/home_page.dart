import 'package:flutter/material.dart';
import 'package:flutter_auto_scroll/src/views/details/details_screen.dart';
import '../../components/fade_animation.dart';
import '../../components/image_list.dart';
import '../../data/movie_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final double textOpacity = 1;
  final int duration = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: ShaderMask(
              blendMode: BlendMode.dstOut,
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.9),
                    Colors.black,
                  ],
                  stops: const [
                    0,
                    0.63,
                    0.69,
                    0.87,
                    1,
                  ],
                ).createShader(rect);
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AnimatedOpacity(
                      duration: Duration(milliseconds: duration),
                      opacity: textOpacity,
                      child: const FadeAnimation(
                        intervalStart: 0.1,
                        child: ImageList(
                          startFrom: 0,
                          duration: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: duration),
                      opacity: textOpacity,
                      child: const FadeAnimation(
                        intervalStart: 0.2,
                        child: ImageList(
                          startFrom: 10,
                          duration: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: duration),
                      opacity: textOpacity,
                      child: const FadeAnimation(
                        intervalStart: 0.3,
                        child: ImageList(
                          startFrom: 20,
                          duration: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: duration),
                      opacity: textOpacity,
                      child: const FadeAnimation(
                        intervalStart: 0.4,
                        child: ImageList(
                          startFrom: 30,
                          duration: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedOpacity(
                      duration: Duration(milliseconds: duration),
                      opacity: textOpacity,
                      child: FadeAnimation(
                          intervalStart: 0.5,
                          child: Column(
                            children: const [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'My List',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: duration),
                      opacity: textOpacity,
                      child: FadeAnimation(
                        intervalStart: 0.6,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.red,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            minimumSize: const Size(110, 43),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                                size: 25,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'PLAY',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: duration),
                      opacity: textOpacity,
                      child: FadeAnimation(
                          intervalStart: 0.7,
                          child: Column(
                            children: const [
                              Icon(
                                Icons.info_outline,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Info',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                AnimatedOpacity(
                  duration: Duration(milliseconds: duration),
                  opacity: textOpacity,
                  child: const FadeAnimation(
                    intervalStart: 0.8,
                    child: Text(
                      'Previewing',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 110,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      String image = 'assets/images/${index + 1}.jpg';
                      return AnimatedOpacity(
                        duration: Duration(milliseconds: duration),
                        opacity: textOpacity,
                        child: FadeAnimation(
                          intervalStart: 0.9,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    image: image,
                                    title: movieTitle[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 100.0,
                              height: 200.0,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(image),
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.redAccent,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
