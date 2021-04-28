
#import <XCTest/XCTest.h>

@interface zMuGetBaBayNameUITestsz : XCTestCase

@end

@implementation zMuGetBaBayNameUITestsz

- (void)setUp {
    

    
    self.continueAfterFailure = NO;

    
}

- (void)tearDown {
    
}

- (void)testExample {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    
    
}

- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, *)) {
        
        [self measureWithMetrics:@[[[XCTApplicationLaunchMetric alloc] init]] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

@end
