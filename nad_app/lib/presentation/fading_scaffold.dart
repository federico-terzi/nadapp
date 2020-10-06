import 'package:flutter/material.dart';
import 'package:flutter_animator/animation/animation_preferences.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in_up.dart';
import 'package:nad_app/theme/style.dart';

class FadingScaffold extends StatelessWidget {
  final List<Widget> children;
  final int delay;
  final bool gradient;
  final Drawer drawer;
  final Key scaffoldKey;
  final RefreshCallback onRefresh;

  const FadingScaffold(
      {@required this.children,
      this.delay = 500,
      this.gradient = false,
      this.drawer,
      this.scaffoldKey,
      this.onRefresh});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List();
    this.children.asMap().forEach((index, child) {
      if (child is Flexible) {
        children.add(Flexible(
          flex: child.flex,
          child: FadeInUp(
            child: child.child,
            preferences: AnimationPreferences(
                offset: Duration(milliseconds: delay * index)),
          ),
        ));
      } else {
        children.add(FadeInUp(
          child: child,
          preferences: AnimationPreferences(
              offset: Duration(milliseconds: delay * index)),
        ));
      }
    });

    Widget child = CustomScrollView(
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
    );

    if (onRefresh != null) {
      child = RefreshIndicator(onRefresh: onRefresh, child: child);
    }

    // Wrap child inside container to apply gradient
    if (gradient) {
      child = Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [MAIN_COLOR, DARKER_COLOR],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: child,
      );
    }

    return Scaffold(
      key: scaffoldKey,
      body: child,
      drawer: drawer,
    );
  }
}
