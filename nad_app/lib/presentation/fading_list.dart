import 'package:flutter/material.dart';
import 'package:flutter_animator/animation/animation_preferences.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in_up.dart';

class FadingList extends StatelessWidget {
  final List<Widget> children;
  final int delay;

  const FadingList({@required this.children, this.delay = 500});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List();
    this.children.asMap().forEach((index, child) {
      children.add(FadeInUp(
        child: child,
        preferences:
            AnimationPreferences(offset: Duration(milliseconds: delay * index)),
      ));
    });

    return Center(
      child: Column(
        children: children,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
