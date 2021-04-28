
#import <UIKit/UIKit.h>
#import "wAppDelegatew.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        
        appDelegateClassName = NSStringFromClass([wAppDelegatew class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
