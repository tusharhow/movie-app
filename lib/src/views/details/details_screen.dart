import 'package:flutter/material.dart';
import '../../components/fade_animation.dart';
import '../../components/froasted_glass_box.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.image, required this.title})
      : super(key: key);
  final String image;
  final String title;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double textOpacity = 1;
  int duration = 1000;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double contWidth = size.width * 0.90;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FrostedGlassBox(
              width: double.infinity,
              height: 340,
              image: widget.image,
              child: Column(
                children: [
                  const SizedBox(height: 3),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: widget.image,
                        child: Image.asset(
                          widget.image,
                          height: 260,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  minimumSize: Size(contWidth, 45),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.play_arrow),
                    SizedBox(width: 5),
                    Text(
                      'PLAY',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: duration),
                opacity: textOpacity,
                child: FadeAnimation(
                  intervalStart: 0.3,
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: duration),
                opacity: textOpacity,
                child: const FadeAnimation(
                  intervalStart: 0.4,
                  child: Text(
                    'lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquam lorem, nec aliquam nisl nisl sit amet lorem. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquam',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AnimatedOpacity(
                opacity: textOpacity,
                duration: Duration(milliseconds: duration),
                child: const FadeAnimation(
                  intervalStart: 0.35,
                  child: Text(
                    'Cast: John Doe, Jane Doe, John Doe, Jane Doe',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14.5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedOpacity(
                  duration: Duration(milliseconds: duration),
                  opacity: textOpacity,
                  child: FadeAnimation(
                    intervalStart: 0.6,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'My List',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: duration),
                  opacity: textOpacity,
                  child: FadeAnimation(
                    intervalStart: 0.65,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Share',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: duration),
                  opacity: textOpacity,
                  child: FadeAnimation(
                    intervalStart: 0.7,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.file_download,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Download',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: duration),
                opacity: textOpacity,
                child: FadeAnimation(
                  intervalStart: 0.4,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/hall.png',
                      width: 300,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
