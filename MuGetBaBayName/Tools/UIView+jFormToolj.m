
#import "UIView+jFormToolj.h"

@implementation UIView (jFormToolj)

- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x{
    self.frame = CGRectMake(x, self.y, self.width, self.height);
}

- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y{
    self.frame = CGRectMake(self.x, y, self.width, self.height);
}

- (CGFloat)width{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width{
    self.frame = CGRectMake(self.x, self.y, width, self.height);
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height{
    self.frame = CGRectMake(self.x, self.y, self.width, height);
}
- (CGFloat)centerX{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)x{
    self.center = CGPointMake(x, self.center.y);
}

- (CGFloat)tCenterYt{
    return self.center.y;
}

- (void)setTCenterYt:(CGFloat)y{
    self.center = CGPointMake(self.center.x, y);
}
- (CGFloat)tMaxXt{
    return self.x + self.width;
}

- (CGFloat)minuteAdam{
    return self.x;
}
- (CGFloat)zMaxYz{
    return self.y + self.height;
}

- (CGFloat)bMinYb{
    return self.y;
}
- (void)setMinuteAdam:(CGFloat)minuteAdam{
    self.x = minuteAdam;
}
- (void)setTMaxXt:(CGFloat)tMaxXt{
    self.x = tMaxXt - self.width;
}
- (void)setBMinYb:(CGFloat)bMinYb{
    self.y = bMinYb;
}
- (void)setZMaxYz:(CGFloat)zMaxYz{
    self.y = zMaxYz - self.height;
}

@end
