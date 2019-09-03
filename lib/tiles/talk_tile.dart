import 'package:flutter/material.dart';
import 'package:flutter_app/datas/speaker_data.dart';
import 'package:flutter_app/pageTransformer/page_item.dart';
import 'package:flutter_app/pageTransformer/page_transformer.dart';
import 'package:flutter_app/screens/speaker_screen.dart';

class TalkTile extends StatefulWidget {
  final vsync;
  final List<SpeakerData> speakerList;

  TalkTile(this.vsync, this.speakerList);

  final state = new _TalkTileState();

  @override
  State<StatefulWidget> createState() {
    return state;
  }
}

class _TalkTileState extends State<TalkTile> {
  AnimationController animationController;

  var positionFeatured = 0;
  var _context;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: widget.vsync, duration: new Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    return new GestureDetector(
      child: new Stack(
        children: <Widget>[
          new FadeTransition(
            opacity: animationController,
            child: new Container(
              child: new PageTransformer(
                  pageViewBuilder: (context, visibilityResolver) {
                return new PageView.builder(
                  controller: new PageController(viewportFraction: 0.9),
                  itemCount: widget.speakerList.length,
                  onPageChanged: (position) {
                    setState(() {
                      positionFeatured = position;
                    });
                  },
                  itemBuilder: (context, index) {
                    final item = widget.speakerList[index];
                    final pageVisibility =
                        visibilityResolver.resolvePageVisibility(index);
                    return new IntroItem(
                        speakerData: item, pageVisibility: pageVisibility);
                  },
                );
              }),
            ),
          ),
        ],
      ),
      onTap: onTabFeatured,
    );
  }

  onTabFeatured() {
    SpeakerData speaker = widget.speakerList[positionFeatured];
    Navigator.of(_context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new SpeakerScreen(speaker);
    }));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
