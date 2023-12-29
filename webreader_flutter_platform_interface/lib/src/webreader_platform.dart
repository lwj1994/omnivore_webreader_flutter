import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'platform_webreader_widget.dart';

class WebReaderPlatform extends PlatformInterface {
  static final Object _token = Object();

  /// Creates a new [WebReaderPlatform].
  WebReaderPlatform() : super(token: _token);

  static WebReaderPlatform? _instance;

  /// The instance of [WebViewPlatform] to use.
  static WebReaderPlatform? get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [WebViewPlatform] when they register themselves.
  static set instance(WebReaderPlatform? instance) {
    if (instance == null) {
      throw AssertionError(
          'Platform interfaces can only be set to a non-null instance');
    }

    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  PlatformWebReaderWidget createPlatformWidget(
    PlatformWebReaderWidgetCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformWidget is not implemented on the current platform.');
  }
}
