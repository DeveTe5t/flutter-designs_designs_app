import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/src/pages/slide_show_page.dart';
import '/src/pages/emergency_page.dart';
import '/src/pages/headers_page.dart';
import '/src/challenges/animated_square_page.dart';
import '/src/pages/circle_graphic_page.dart';
import '/src/pages/pinterest_page.dart';
import '/src/pages/sliver_list_page.dart';

final pageRoutes = <_Route>[
  _Route(
    icon: FontAwesomeIcons.slideshare,
    title: 'Slideshow',
    page: const SlideShowPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.truckMedical,
    title: 'Emergency',
    page: const EmergencyPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.heading,
    title: 'Headers',
    page: const HeadersPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.peopleCarryBox,
    title: 'Animated Square',
    page: const AnimatedSquarePage(),
  ),
  _Route(
    icon: FontAwesomeIcons.circleNotch,
    title: 'Progress Circle',
    page: const CircleGraphicPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.pinterest,
    title: 'Pinterest',
    page: const PinterestPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.mobile,
    title: 'Slivers',
    page: const SliverListPage(),
  ),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route({required this.icon, required this.title, required this.page});
}
