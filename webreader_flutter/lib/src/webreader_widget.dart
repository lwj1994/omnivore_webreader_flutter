import 'package:flutter/cupertino.dart';
import 'package:webreader_flutter_platform_interface/webreader_flutter_platform_interface.dart';

/// @author luwenjie on 2023/12/19 13:45:21
///

class WebReaderWidget extends StatelessWidget {
  final PlatformWebReaderWidget platform;


  WebReaderWidget(this.platform);

  WebReaderWidget.fromPlatform({super.key, required this.platform});

  @override
  Widget build(BuildContext context) {
    return platform.build(context);
  }
}
