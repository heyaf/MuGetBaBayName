
#import "SceneDelegate.h"
#import "dMUTabbarVCd.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindowScene*windowScene = (UIWindowScene*)scene;

      self.window = [[UIWindow alloc] initWithWindowScene:windowScene];

      self.window.frame = windowScene.coordinateSpace.bounds;

      self.window.rootViewController = [[dMUTabbarVCd alloc] init];

      [self.window makeKeyAndVisible];
}
- (void)sceneDidDisconnect:(UIScene *)scene {
    
    
    
    
}
- (void)sceneDidBecomeActive:(UIScene *)scene {
    
    
}
- (void)sceneWillResignActive:(UIScene *)scene {
    
    
}
- (void)sceneWillEnterForeground:(UIScene *)scene {
    
    
}
- (void)sceneDidEnterBackground:(UIScene *)scene {
    
    
    
}
@end
