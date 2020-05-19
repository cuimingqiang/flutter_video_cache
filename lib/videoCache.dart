import 'dart:async';

import 'package:flutter/services.dart';

class VideoCache {
  static const MethodChannel _channel = const MethodChannel('videoCache');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> cacheUrl(String url) async {
    final String cache =
        await _channel.invokeMethod("cacheUrl", <String, String>{"url": url});
    return cache;
  }
}
