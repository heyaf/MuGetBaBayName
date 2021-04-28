
#import "BarrierSource.h"

@implementation BarrierSource

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat barNum = 0;

    barNum = 4.0;
    CGFloat w = self.width/barNum;
    

    
    
    
    
    NSUInteger count = self.subviews.count;
    for (NSUInteger i = 0 , j = 0; i < count; i++) {
        UIView *view = self.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            view.width = self.width / barNum;
            view.x = self.width * j / barNum;
            j++;
             
        }
    }
    
}
- (void) fDidClickPublishBtnf:(UIButton*)sender {
    

}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    
    
    
    
    if (self.isHidden == NO) {
                
            
            return [super hitTest:point withEvent:event];
    }
    
    else {
        
        return [super hitTest:point withEvent:event];
    }
}
@end
