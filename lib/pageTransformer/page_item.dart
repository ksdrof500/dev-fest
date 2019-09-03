import 'package:flutter/material.dart';
import 'package:flutter_app/datas/speaker_data.dart';
import 'package:meta/meta.dart';
import 'page_transformer.dart';

class IntroItem extends StatelessWidget {
  IntroItem({
    @required this.speakerData,
    @required this.pageVisibility,
  });

  final SpeakerData speakerData;
  final PageVisibility pageVisibility;

  Widget _applyTextEffects({
    @required double translationFactor,
    @required Widget child,
  }) {
    final double xTranslation = pageVisibility.pagePosition * translationFactor;

    return new Opacity(
      opacity: pageVisibility.visibleFraction,
      child: new Transform(
        alignment: FractionalOffset.topLeft,
        transform: new Matrix4.translationValues(
          xTranslation,
          0.0,
          0.0,
        ),
        child: child,
      ),
    );
  }

  _buildTextContainer(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final categoryText = _applyTextEffects(
      translationFactor: 300.0,
      child: new Text(
        speakerData.speakerList.first,
        style: textTheme.caption.copyWith(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          fontSize: 14.0,
        ),
        textAlign: TextAlign.center,
      ),
    );

    final titleText = _applyTextEffects(
      translationFactor: 200.0,
      child: new Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: new Text(
          speakerData.title,
          style: textTheme.title.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return new Positioned(
      bottom: 56.0,
      left: 32.0,
      right: 32.0,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          categoryText,
          titleText,
        ],
      ),
    );
  }

  Widget _getImageNetwork(url) {
    try {
      if (url != '') {
        return new FadeInImage.assetNetwork(
//          placeholder: 'assets/place_holder.jpg',
          image: url,
          fit: BoxFit.cover,
          alignment: new FractionalOffset(
            0.5 + (pageVisibility.pagePosition / 3),
            0.5,
          ),
        );
      } else {
//        return new Image.asset('assets/place_holder_2.jpg');
      }
    } catch (e) {
//      return new Image.asset('assets/place_holder_2.jpg');
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageOverlayGradient = new DecoratedBox(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            const Color(0xFF000000),
            const Color(0x00000000),
          ],
        ),
      ),
    );

    return new Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 8.0,
      ),
      child: new Material(
        elevation: 4.0,
        borderRadius: new BorderRadius.circular(8.0),
        child: new Stack(
          fit: StackFit.expand,
          children: [
            _getImageNetwork(speakerData.imageList.first),
            imageOverlayGradient,
            _buildTextContainer(context),
          ],
        ),
      ),
    );
  }
}