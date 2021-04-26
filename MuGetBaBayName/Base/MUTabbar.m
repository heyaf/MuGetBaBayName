//
//  MUTabbar.m
//  MuGetBaBayName
//
//  Created by iOS on 2021/4/26.
//

#import "MUTabbar.h"

@implementation MUTabbar

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat barNum = 0;

    barNum = 4.0;
    CGFloat w = self.width/barNum;
    

    
    
    
    // 其他位置按钮
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

// 点击发布
- (void) didClickPublishBtn:(UIButton*)sender {
    //    NSLog(@"点击了发布");

}

//重写hitTest方法，去监听发布按钮的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    //这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
    //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
    //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
    //是的话让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (self.isHidden == NO) {
                
            
            return [super hitTest:point withEvent:event];
    }
    
    else {//tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        
        return [super hitTest:point withEvent:event];
    }
}


@end
