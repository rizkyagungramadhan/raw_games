import 'dart:async';

import 'package:flutter/material.dart';
import 'package:raw_games/utils/style/app_dimen.dart';

/// Widget which build adaptive widget based on the text content length
/// It will automatically build Marquee if text was too long to write in single line
class AdaptiveMarqueeText extends StatefulWidget {
  /// Text content will be showing
  final String text;

  /// Style for the text
  final TextStyle? style;

  /// Ratio of blank space between start & end character
  /// (only used for Marquee)
  final double ratioOfSpace;

  /// Force widget to build as Marquee even when the text is too short in single line
  final bool forceToMarquee;

  /// Animation time for Marquee in milliseconds
  /// (only used for Marquee)
  final int marqueeAnimationTime;

  /// For adapting start & end linear gradient with current parent widget color
  /// (only used for Marquee)
  final Color? bgMarqueeColor;

  const AdaptiveMarqueeText(
    this.text, {
    this.style,
    this.ratioOfSpace = 0.25,
    this.forceToMarquee = false,
    this.marqueeAnimationTime = 100,
    this.bgMarqueeColor,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdaptiveMarqueeTextState();
  }
}

class _AdaptiveMarqueeTextState extends State<AdaptiveMarqueeText>
    with SingleTickerProviderStateMixin {
  late ScrollController scrollController;
  late double screenWidth;
  late double screenHeight;
  double position = 0.0;
  Timer? timer;
  final double _moveDistance = 3.0;
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      startTimer();
    });
  }

  void startTimer() {
    if (_key.currentContext != null) {
      var widgetWidth =
          _key.currentContext?.findRenderObject()?.paintBounds.size.width ?? 0;

      timer = Timer.periodic(
          Duration(milliseconds: widget.marqueeAnimationTime), (timer) {
        if (!scrollController.hasClients) return;
        var maxScrollExtent = scrollController.position.maxScrollExtent;
        var pixels = scrollController.position.pixels;
        if (pixels + _moveDistance >= maxScrollExtent) {
          position = (maxScrollExtent -
                      screenWidth * widget.ratioOfSpace +
                      widgetWidth) /
                  2 -
              widgetWidth +
              pixels -
              maxScrollExtent;
          scrollController.jumpTo(position);
        }
        position += _moveDistance;
        scrollController.animateTo(position,
            duration: Duration(milliseconds: widget.marqueeAnimationTime),
            curve: Curves.linear);
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  Widget getBothEndsChild() {
    return Center(
      child: Text(
        widget.text,
        style: widget.style,
      ),
    );
  }

  Widget getCenterChild() {
    return Container(width: screenWidth * widget.ratioOfSpace);
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return _AdaptiveText(widget.text, style: widget.style,
        builder: (textHeight, isLineExceeded) {
      if (isLineExceeded || widget.forceToMarquee) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: textHeight,
            maxHeight: textHeight,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.zero,
                  key: _key,
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    getBothEndsChild(),
                    getCenterChild(),
                    getBothEndsChild(),
                  ],
                ),
                if (widget.bgMarqueeColor is Color) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: AppDimen.paddingMedium,
                      transform: Matrix4.translationValues(-0.5, 0.0, 0.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            widget.bgMarqueeColor!,
                            widget.bgMarqueeColor!.withOpacity(0.5),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: const [0.0, 1.0],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: AppDimen.paddingMedium,
                      transform: Matrix4.translationValues(0.5, 0.0, 0.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            widget.bgMarqueeColor!,
                            widget.bgMarqueeColor!.withOpacity(0.5),
                          ],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          stops: const [0.0, 1.0],
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      }

      return Text(
        widget.text,
        style: widget.style,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    });
  }
}

typedef TextHeightBuilder = Widget Function(
  double textHeight,
  bool isLineExceeded,
);

class _AdaptiveText extends StatelessWidget {
  final TextHeightBuilder builder;
  final String text;
  final TextStyle? style;

  const _AdaptiveText(
    this.text, {
    required this.builder,
    this.style,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      ///Build TextSpan for calculation purpose
      var span = TextSpan(
        text: text,
        style: style,
      );

      ///Use TextPainter to determine if it will exceed max lines
      final textPainter = TextPainter(
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        text: span,
        maxLines: 1,
      );

      ///Trigger TextPainter into layout
      textPainter.layout(maxWidth: size.maxWidth);

      ///Check whether the text overflowed or not
      final isOverflowed = textPainter.didExceedMaxLines;
      final textPainterHeight = textPainter.height;

      return builder(
        textPainterHeight,
        isOverflowed,
      );
    });
  }
}
