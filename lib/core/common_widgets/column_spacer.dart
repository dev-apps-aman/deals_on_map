import 'package:deals_on_map/core/common_widgets/spacer.dart';
import 'package:flutter/material.dart';




class ColumnSpacer extends StatelessWidget {
/*  /// This snippet shows O/P of [ColumnSpacer].
  ///
  /// ```dart
  /// I/P : [19, 21]
  /// O/P : [19, 7, 21]
  ///
  /// I/P : [19, 21, 23]
  /// O/P : [19, 7, 21, 7, 23]
  /// ```
  /// {@end-tool}*/
  const ColumnSpacer({
    super.key,
    required this.children,
    this.spacerWidget = const SpacerVertical(height: 8,),
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
  })  : assert(
  children.length > 1,
  'children should be more than 1',
  );

  final CrossAxisAlignment crossAxisAlignment;

  final List<Widget> children;

  final Widget spacerWidget;

  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {

    final List<Widget> spacedChildren = <Widget>[];

    for (int i = 0; i < children.length; i++) {
      if (i == 0) {
        spacedChildren.add(children[i]);
      } else if (i == children.length - 1) {
        spacedChildren.add(spacerWidget);
        spacedChildren.add(children[i]);
      } else {
        spacedChildren.add(spacerWidget);
        spacedChildren.add(children[i]);
      }
    }

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: spacedChildren,
    );
  }
}