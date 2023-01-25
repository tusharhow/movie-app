import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../data/movie_title.dart';
import '../views/details/details_screen.dart';

class ImageList extends StatefulWidget {
  const ImageList({Key? key, this.startFrom = 0, this.duration = 30})
      : super(key: key);
  final int startFrom;
  final int duration;
  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        autoScrollImage();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      autoScrollImage();
    });
  }

  void autoScrollImage() {
    final currentScrollPosition = _scrollController.offset;
    final endScrollPosition = _scrollController.position.maxScrollExtent;
    final beginScrollPosition = _scrollController.position.minScrollExtent;
    scheduleMicrotask(() {
      if (currentScrollPosition == endScrollPosition) {
        _scrollController.animateTo(
          beginScrollPosition,
          duration: Duration(seconds: widget.duration),
          curve: Curves.linear,
        );
      }
      if (currentScrollPosition == beginScrollPosition) {
        _scrollController.animateTo(
          endScrollPosition,
          duration: Duration(seconds: widget.duration),
          curve: Curves.linear,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(() {
      autoScrollImage();
    });
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi * 1.95,
      child: SizedBox(
        height: 130,
        child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              String image =
                  'assets/images/${index + 1 + widget.startFrom}.jpg';
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        image: image,
                        title: movieTitle[index + 1 + widget.startFrom - 1],
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: image,
                  child: Image.asset(
                    image,
                    width: 95,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
