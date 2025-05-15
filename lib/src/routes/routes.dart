import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/src/pages/pages.dart';
import '/src/challenges/animated_square_page.dart';
import '/src/labs/circular_progress_page.dart';

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
    icon: FontAwesomeIcons.heading,
    title: 'Headers 1',
    page: const HeadersPage1(),
  ),
  _Route(
    icon: FontAwesomeIcons.heading,
    title: 'Headers 2',
    page: const HeadersPage2(),
  ),
  _Route(
    icon: FontAwesomeIcons.heading,
    title: 'Headers 3',
    page: const HeadersPage3(),
  ),
  _Route(
    icon: FontAwesomeIcons.heading,
    title: 'Headers 4',
    page: const HeadersPage4(),
  ),
  _Route(
    icon: FontAwesomeIcons.heading,
    title: 'Headers 5',
    page: const HeadersPage5(),
  ),
  _Route(
    icon: FontAwesomeIcons.heading,
    title: 'Headers 6',
    page: const HeadersPage6(),
  ),
  _Route(
    icon: FontAwesomeIcons.heading,
    title: 'Headers 7',
    page: const HeadersPage7(),
  ),
  _Route(icon: FontAwesomeIcons.f, title: 'Footers', page: const FootersPage()),
  _Route(
    icon: FontAwesomeIcons.peopleCarryBox,
    title: 'Animated Square 0',
    page: const AnimationsPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.peopleCarryBox,
    title: 'Animated Square',
    page: const AnimatedSquarePage(),
  ),
  _Route(
    icon: FontAwesomeIcons.circle,
    title: 'Progress Circle 0',
    page: const CircularPregressPage(),
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
