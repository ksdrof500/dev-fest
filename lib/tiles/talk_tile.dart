import 'package:flutter/material.dart';
import 'package:flutter_app/pageTransformer/page_item.dart';
import 'package:flutter_app/pageTransformer/page_transformer.dart';
import 'package:flutter_app/widgets/error_connection.dart';


class TalkTile extends StatefulWidget {
  final vsync;
  var errorConection = false;

  TalkTile(this.vsync);

  final state = new _ContentFeaturedState();

  @override
  State<StatefulWidget> createState() {
    return state;
  }
}

class _ContentFeaturedState extends State<TalkTile> {
  List _destaque = new List();
  AnimationController animationController;

  var carregando = false;

  var positionFeatured = 0;

  var _context;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
        vsync: widget.vsync, duration: new Duration(milliseconds: 300));

    loadNewsRecent();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    if (!widget.errorConection) {
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
                        itemCount: _destaque.length,
                        onPageChanged: (position) {
                          setState(() {
                            positionFeatured = position;
                          });
                        },
                        itemBuilder: (context, index) {
                          final item = _destaque[index];
                          final pageVisibility =
                          visibilityResolver.resolvePageVisibility(index);
                          return new IntroNewsItem(
                              item: item, pageVisibility: pageVisibility);
                        },
                      );
                    }),
              ),
            ),
            _getProgress()
          ],
        ),
        onTap: onTabFeatured,
      );
    } else {
      return ErrorConnection();
    }
  }

  onTabFeatured() {
    IntroNews notice = _destaque[positionFeatured];

//    Navigator.of(_context)
//        .push(new MaterialPageRoute(builder: (BuildContext context) {
//      return new DetailPage(notice.imageUrl, notice.title, notice.date,
//          notice.description, notice.link, notice.origin);
//    }));
  }

  Widget _getProgress() {
    if (carregando) {
      return new Container(
        child: new Center(
          child: new CircularProgressIndicator(),
        ),
      );
    } else {
      return new Container();
    }
  }


  void loadNewsRecent() async {
    setState(() {
      _destaque.clear();
      carregando = true;
    });

//    Map result = await repositoty.loadNewsRecent();

//    if (result != null) {
//      widget.errorConection = false;
//
//      setState(() {
//        result['data'].forEach((item) {
//          var destaque = new IntroNews(
//              item['tittle'],
//              item['category'],
//              item['url_img'],
//              item['description'],
//              item['date'],
//              item['link'],
//              item['origin']);
//
//          _destaque.add(destaque);
//        });
//
//        carregando = false;
//
//        animationController.forward();
//      });
//    } else {
//      widget.errorConection = true;
//      setState(() {
//        carregando = false;
//      });
//    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}