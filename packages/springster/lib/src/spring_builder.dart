import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:springster/springster.dart';

/// Builds a widget that continuously animates a value using a Spring simulation
/// with a given [SpringDescription].
///
/// See also:
///   * [useSpringAnimation], which provides the underlying animation hook
///   * [SpringBuilder2D], which animates two values simultaneously
class SpringBuilder<T> extends HookWidget {
  /// Creates a widget that animates a single value using spring physics.
  ///
  /// The [builder], [spring], and [value] arguments must not be null.
  const SpringBuilder({
    required this.builder,
    required this.spring,
    required this.value,
    this.simulate = true,
    super.key,
  });

  /// The target value for the transition.
  ///
  /// Whenever this value changes, the widget smoothly animates from
  /// the previous value to the new one.
  final T value;

  /// Called to build the child widget.
  ///
  /// The [builder] function is passed the interpolated value from the spring
  /// animation.
  final Widget Function(BuildContext context, T value) builder;

  /// The spring behavior of the transition.
  ///
  /// Modify this for bounciness and duration.
  final SpringDescription spring;

  /// Whether to simulate the spring animation.
  ///
  /// If false, the animation will be immediately set to the target value.
  final bool simulate;

  @override
  Widget build(BuildContext context) {
    final value = useSpringAnimation(
      value: this.value,
      spring: spring,
      simulate: simulate,
    );
    return builder(context, value);
  }
}

/// Builds a widget that continuously animates two values using a Spring simulation
/// with a given [SpringDescription].
///
/// See also:
///   * [use2DSpringAnimation], which provides the underlying animation hook
///   * [SpringBuilder], which animates a single value
class SpringBuilder2D<T> extends HookWidget {
  /// Creates a widget that animates two values using spring physics.
  ///
  /// The [builder], [spring], and [value] arguments must not be null.
  const SpringBuilder2D({
    required this.builder,
    required this.spring,
    required this.value,
    this.simulate = true,
    super.key,
  });

  /// The target (x,y) values for the transition.
  ///
  /// Whenever these values change, the widget smoothly animates from
  /// the previous values to the new ones.
  final (T x, T y) value;

  /// Called to build the child widget.
  ///
  /// The [builder] function is passed the interpolated (x,y) values from the
  /// spring animation.
  final Widget Function(BuildContext context, (T x, T y) value) builder;

  /// The spring behavior of the transition.
  ///
  /// Modify this for bounciness and duration.
  final SpringDescription spring;

  /// Whether to simulate the spring animation.
  ///
  /// If false, the animation will be immediately set to the target value.
  final bool simulate;

  @override
  Widget build(BuildContext context) {
    final value = use2DSpringAnimation(
      value: this.value,
      spring: spring,
      simulate: simulate,
    );
    return builder(context, value);
  }
}
