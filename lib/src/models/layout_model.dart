import 'package:flutter/material.dart';

import '/src/pages/pages.dart';

class LayoutModel with ChangeNotifier {
  // Widget _currentPage = const SlideShowPage();
  Widget _currentPage = const PinterestPage();

  Widget get currentPage => _currentPage;

  set currentPage(Widget page) {
    if (_currentPage == page) return;

    _currentPage = page;

    notifyListeners();
  }
}

class LayoutModelNotifier extends InheritedNotifier<LayoutModel> {
  const LayoutModelNotifier({
    super.key,
    required LayoutModel model,
    required super.child,
  }) : super(notifier: model);

  static LayoutModel watch(BuildContext context) {
    final notifier =
        context
            .dependOnInheritedWidgetOfExactType<LayoutModelNotifier>()
            ?.notifier;
    assert(notifier != null, 'No LayoutModel found in context');
    return notifier!;
  }

  static LayoutModel read(BuildContext context) {
    final widget =
        context
            .getElementForInheritedWidgetOfExactType<LayoutModelNotifier>()
            ?.widget;
    assert(widget is LayoutModelNotifier, 'No LayoutModel found in context');
    return (widget as LayoutModelNotifier).notifier!;
  }
}
