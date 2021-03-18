#import "AdvertisingIdentifierPlugin.h"
#import <AdSupport/AdSupport.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>

@implementation AdvertisingIdentifierPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel
        methodChannelWithName:@"v7lin.github.io/advertising_identifier"
              binaryMessenger:[registrar messenger]];
    AdvertisingIdentifierPlugin *instance =
        [[AdvertisingIdentifierPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call
                  result:(FlutterResult)result {
    if ([@"getAdvertisingIdInfo" isEqualToString:call.method]) {
        NSString *idfa = [ASIdentifierManager sharedManager].advertisingIdentifier.UUIDString;
        BOOL isAdvertisingTrackingEnabled = NO;
        NSUInteger authorizationStatus = 0;
        if (@available(iOS 14.0, *)) {
            authorizationStatus = [ATTrackingManager trackingAuthorizationStatus];
            switch ([ATTrackingManager trackingAuthorizationStatus]) {
                case ATTrackingManagerAuthorizationStatusNotDetermined:
                    isAdvertisingTrackingEnabled = YES;
                    break;
                case ATTrackingManagerAuthorizationStatusRestricted:
                    isAdvertisingTrackingEnabled = YES;
                    break;
                case ATTrackingManagerAuthorizationStatusDenied:
                    isAdvertisingTrackingEnabled = NO;
                    break;
                case ATTrackingManagerAuthorizationStatusAuthorized:
                    isAdvertisingTrackingEnabled = NO;
                    break;
                default:
                    isAdvertisingTrackingEnabled = NO;
                    break;
            }
        } else {
            isAdvertisingTrackingEnabled = [[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled];
        }
        result(@{
            @"id" : idfa,
            @"is_limit_ad_tracking_enabled" : [NSNumber numberWithBool:isAdvertisingTrackingEnabled],
            @"authorization_status" : [NSNumber numberWithUnsignedInteger:authorizationStatus],
        });
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
