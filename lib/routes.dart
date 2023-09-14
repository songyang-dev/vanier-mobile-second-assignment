import 'package:flutter/material.dart';

import 'home/home.dart';
import 'profile/profile.dart';
import 'summary/summary.dart';

var routes = {
  '/home': (BuildContext context) => const HomeScreen(),
  '/summary': (BuildContext context) => const SummaryScreen(),
  '/profile': (BuildContext context) => const ProfileScreen(),
};
