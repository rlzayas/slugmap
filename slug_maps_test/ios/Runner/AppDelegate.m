#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
@import GoogleMaps;



@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GMSServices provideAPIKey:@"AIzaSyCs5t2Y6aEBSjLS4BxReM_QBsmNBW2vxE0"];
    [GeneratedPluginRegistrant registerWithRegistry:self];

  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
