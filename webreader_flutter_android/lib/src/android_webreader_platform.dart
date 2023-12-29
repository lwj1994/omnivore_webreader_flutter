import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:webreader_flutter_platform_interface/platform_interface.dart';
import 'instance_manager.dart';

/// @author luwenjie on 2023/12/20 19:27:40

class AndroidWebReaderPlatform extends WebReaderPlatform {
  /// Registers this class as the default instance of [WebReaderPlatform].
  static void registerWith() {
    WebReaderPlatform.instance = AndroidWebReaderPlatform();
  }

  @override
  PlatformWebReaderWidget createPlatformWidget(
      PlatformWebReaderWidgetCreationParams params) {
    return super.createPlatformWidget(params);
  }
}

class AndroidPlatformWidget extends PlatformWebReaderWidget {
  /// Constructs a [AndroidPlatformWidget].
  AndroidPlatformWidget(PlatformWebReaderWidgetCreationParams params)
      : super.implementation(
          params is AndroidCreationParams
              ? params
              : AndroidCreationParams.fromParams(params),
        );

  AndroidCreationParams get _androidParams => params as AndroidCreationParams;
  final _viewType = "plugins.omnivore/webreader";

  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
      key: _androidParams.key ?? ValueKey(_androidParams),
      viewType: _viewType,
      surfaceFactory:
          (BuildContext context, PlatformViewController controller) {
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          gestureRecognizers: _androidParams.gestureRecognizers,
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        );
      },
      onCreatePlatformView: (PlatformViewCreationParams params) {
        return _initAndroidView(
          params,
        )
          ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
          ..create();
      },
    );
  }

  AndroidViewController _initAndroidView(
    PlatformViewCreationParams params, {
    TextDirection layoutDirection = TextDirection.ltr,
  }) {
    return PlatformViewsService.initExpensiveAndroidView(
        id: params.id,
        viewType: _viewType,
        creationParams: params,
        creationParamsCodec: const StandardMessageCodec(),
        layoutDirection: TextDirection.ltr);
  }
}

class AndroidCreationParams extends PlatformWebReaderWidgetCreationParams {
  /// Creates [AndroidCreationParams].
  const AndroidCreationParams({
    super.key,
    @visibleForTesting InstanceManager? instanceManager,
    required super.gestureRecognizers,
  });

  /// Constructs a [WebKitWebViewWidgetCreationParams] using a
  /// [PlatformWebReaderWidgetCreationParams].
  AndroidCreationParams.fromParams(
    PlatformWebReaderWidgetCreationParams params, {
    bool displayWithHybridComposition = false,
    @visibleForTesting InstanceManager? instanceManager,
  }) : this(
            key: params.key,
            instanceManager: instanceManager,
            gestureRecognizers: const <Factory<
                OneSequenceGestureRecognizer>>{});
}
