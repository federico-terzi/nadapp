import 'package:flutter/material.dart';
import 'package:flutter_animator/animation/animation_preferences.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in_up.dart';

class FadingColumn extends StatelessWidget {
  final List<Widget> children;
  final int delay;

  const FadingColumn({@required this.children, this.delay = 500});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List();
    this.children.asMap().forEach((index, child) {
      if (child is Flexible) {
        children.add(Flexible(
          flex: child.flex,
          child: FadeInUp(
            child: child.child,
            preferences:
            AnimationPreferences(offset: Duration(milliseconds: delay * index)),
          ),
        ));
      } else {
        children.add(FadeInUp(
          child: child,
          preferences:
          AnimationPreferences(offset: Duration(milliseconds: delay * index)),
        ));
      }
    });

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
                mainAxisSize: MainAxisSize.max,
              ),
            ),
          ),
        ],
      )
    );
  }
}
