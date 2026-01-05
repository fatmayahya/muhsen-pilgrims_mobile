import 'package:flutter/material.dart';
import '../../themes/app_spacing.dart';  

/// 📐 Layout 
class AppLayout extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final bool useSafeArea;
  final bool addHorizontalPadding;
  final bool addVerticalPadding;

  const AppLayout({
    super.key,
    required this.child,
    this.padding,
    this.useSafeArea = true,
    this.addHorizontalPadding = true,
    this.addVerticalPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = child;

    //  Padding
    if (padding != null) {
      content = Padding(padding: padding!, child: content);
    } else {
      final horizontalPadding = addHorizontalPadding ? AppSpacing.xl : 0.0;
      final verticalPadding = addVerticalPadding ? AppSpacing.xl : 0.0;

      if (horizontalPadding > 0 || verticalPadding > 0) {
        content = Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: content,
        );
      }
    }

    // SafeArea
    if (useSafeArea) {
      content = SafeArea(child: content);
    }

    return content;
  }
}

/// 📐 Scrollable Layout
class AppScrollableLayout extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final bool useSafeArea;

  const AppScrollableLayout({
    super.key,
    required this.child,
    this.padding,
    this.useSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      useSafeArea: useSafeArea,
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        padding: padding ?? AppSpacing.screenPadding,
        child: child,
      ),
    );
  }
}

/// 📐 Column Layout 
class AppColumnLayout extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double spacing;
  final EdgeInsets? padding;
  final bool useSafeArea;
  final bool scrollable;

  const AppColumnLayout({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing = AppSpacing.lg,
    this.padding,
    this.useSafeArea = true,
    this.scrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    final column = Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: _addSpacing(children, spacing),
    );

    if (scrollable) {
      return AppScrollableLayout(
        useSafeArea: useSafeArea,
        padding: padding ?? AppSpacing.screenPadding,
        child: column,
      );
    }

    return AppLayout(
      useSafeArea: useSafeArea,
      padding: padding ?? AppSpacing.screenPadding,
      child: column,
    );
  }

  List<Widget> _addSpacing(List<Widget> children, double spacing) {
    if (children.isEmpty) return children;

    final List<Widget> spacedChildren = [];
    for (int i = 0; i < children.length; i++) {
      spacedChildren.add(children[i]);
      if (i < children.length - 1) {
        spacedChildren.add(SizedBox(height: spacing));
      }
    }
    return spacedChildren;
  }
}