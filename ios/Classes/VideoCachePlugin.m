

#import "VideoCachePlugin.h"
#import <KTVHTTPCache/KTVHTTPCache.h>
@implementation VideoCachePlugin
static FlutterMethodChannel* channel;

+(void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  channel = [FlutterMethodChannel methodChannelWithName:@"videoCache"
 binaryMessenger:[registrar messenger]];
    [registrar addMethodCallDelegate:[[VideoCachePlugin alloc]init] channel:channel];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [KTVHTTPCache logSetConsoleLogEnable:YES];
        NSError *error = nil;
        [KTVHTTPCache proxyStart:&error];
        if (error) {
            NSLog(@"Proxy Start Failure, %@", error);
        } else {
            NSLog(@"Proxy Start Success");
        }
        [KTVHTTPCache encodeSetURLConverter:^NSURL *(NSURL *URL) {
            NSLog(@"URL Filter reviced URL : %@", URL);
            return URL;
        }];
        [KTVHTTPCache downloadSetUnacceptableContentTypeDisposer:^BOOL(NSURL *URL, NSString *contentType) {
            NSLog(@"Unsupport Content-Type Filter reviced URL : %@, %@", URL, contentType);
            return NO;
        }];
    }
    return self;
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result{
    if([@"cacheUrl" isEqualToString:call.method]){
        NSString* url =  (NSString*)call.arguments[@"url"];
        NSURL *proxyURL = [KTVHTTPCache proxyURLWithOriginalURL:[NSURL URLWithString:url]];
        
        result([proxyURL absoluteString]);
    }else{
        result([[UIDevice currentDevice]systemName]);
    }
}
@end
