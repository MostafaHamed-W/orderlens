import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

/// A simple placeholder that can be used to search all the hardcoded strings
/// in the code (useful to identify strings that need to be localized).
extension StringHardcoded on String {
  String get hardcoded => this;
}


extension DateFormatter on DateTime {
  String get dateWithTime => DateFormat('d MMM yyyy \'at\' h:mm a', 'en').format(this);
  String get dayName => DateFormat('EEE', 'en').format(this);
  String get monthName => DateFormat('MMM', 'en').format(this);
  String get fullMonthName => DateFormat('MMMM', 'en').format(this);
  String get fullDate => DateFormat('d MMM yyyy', 'en').format(this);
}

extension FancyIterable on Iterable<int> {
  int get maxValue => reduce(math.max);
  int get minValue => reduce(math.min);
}
