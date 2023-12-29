import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'webreader_platform.dart';

/// @author luwenjie on 2023/12/19 13:47:34
///

/// Interface for a platform implementation of a web view widget.
abstract class PlatformWebReaderWidget extends PlatformInterface {
  /// Creates a new [PlatformWebReaderWidget]
  factory PlatformWebReaderWidget(
      PlatformWebReaderWidgetCreationParams params) {
    assert(
      WebReaderPlatform.instance != null,
      'A platform implementation has not been set. Please '
      'ensure that an implementation of `WebReaderPlatform` has been set to '
      '`WebReaderPlatform.instance` before use. For unit testing, '
      '`WebReaderPlatform.instance` can be set with your own test implementation.',
    );
    final PlatformWebReaderWidget webViewWidgetDelegate =
        WebReaderPlatform.instance!.createPlatformWidget(params);
    PlatformInterface.verify(webViewWidgetDelegate, _token);
    return webViewWidgetDelegate;
  }

  /// Used by the platform implementation to create a new
  /// [PlatformWebReaderWidget].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  PlatformWebReaderWidget.implementation(this.params) : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [PlatformWebReaderWidget].
  final PlatformWebReaderWidgetCreationParams params;

  /// Builds a new WebView.
  ///
  /// Returns a Widget tree that embeds the created web view.
  Widget build(BuildContext context);
}

@immutable
class PlatformWebReaderWidgetCreationParams {
  /// Controls how one widget replaces another widget in the tree.
  ///
  /// See also:
  ///
  ///  * The discussions at [Key] and [GlobalKey].
  final Key? key;
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers;

  const PlatformWebReaderWidgetCreationParams({this.key, required this.gestureRecognizers});
}
