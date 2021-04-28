
#import "wAppDelegatew.h"
#import "wAppDelegatew+lSettingl.h"
#import "dMUTabbarVCd.h"
@interface wAppDelegatew ()

@end

@implementation wAppDelegatew
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window.rootViewController = [[dMUTabbarVCd alloc] init];

    
    return YES;
}
- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    
    
    return [[UISceneConfiguration alloc] initWithName:[NSString stringWithFormat:@"%@%@%@",@"De",@"fault Configuratio",@"n"] sessionRole:connectingSceneSession.role];
}
- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    
    
    
}
@end
