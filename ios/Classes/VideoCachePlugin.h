#import <Flutter/Flutter.h>

@interface VideoCachePlugin : NSObject<FlutterPlugin>
+(void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar;
- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result;
@end
