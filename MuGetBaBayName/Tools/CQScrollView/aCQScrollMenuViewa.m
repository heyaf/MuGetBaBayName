
#import "aCQScrollMenuViewa.h"

@interface aCQScrollMenuViewa ()

@end

@implementation aCQScrollMenuViewa{
    
    UIView *_bLastViewb;
    
    UIView *_uLineViewu;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.showsHorizontalScrollIndicator = NO;
        _eCurrentButtonIndexe = 0; 
    }
    return self;
}


- (void)setSTitleArrays:(NSArray *)sTitleArrays{
    _sTitleArrays = sTitleArrays;
    
    
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
    
    
    _bLastViewb = nil;
    
    
    [_sTitleArrays enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *menuButton = [[UIButton alloc]init];
        [self addSubview:menuButton];
        if (_bLastViewb) {
            menuButton.frame = CGRectMake(_bLastViewb.tMaxXt + 10, 0, 100, self.height);
        }else{
            menuButton.frame = CGRectMake(0, 0, 100, self.height);
        }
        
        menuButton.tag = 100 + idx;
        [menuButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [menuButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [menuButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [menuButton setTitle:obj forState:UIControlStateNormal];
        [menuButton addTarget:self action:@selector(menuReleaseDawn:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [menuButton sizeToFit];
        menuButton.height = self.height;
        
        
        [menuButton layoutIfNeeded];
        
        
        if (idx == 0) {
            menuButton.selected = YES;
            _uLineViewu = [[UIView alloc]init];
            [self addSubview:_uLineViewu];
            _uLineViewu.bounds = CGRectMake(0, 0, menuButton.titleLabel.width, 2);
            _uLineViewu.center = CGPointMake(menuButton.centerX, self.height - 1);
            _uLineViewu.backgroundColor = [UIColor redColor];
        }
        
        _bLastViewb = menuButton;
    }];
    
    self.contentSize = CGSizeMake(CGRectGetMaxX(_bLastViewb.frame), CGRectGetHeight(self.frame));
    
    
    if (_bLastViewb.tMaxXt < self.width) {
        int i = 0;
        for (UIButton *button in self.subviews) {
            if ([button isMemberOfClass:[UIButton class]]) {
                button.width = self.width / _sTitleArrays.count;
                button.x = i * button.width;
                button.titleLabel.adjustsFontSizeToFitWidth = YES; 
                if (i == 0) {
                    _uLineViewu.width = button.titleLabel.width;
                    _uLineViewu.centerX = button.centerX;
                    _uLineViewu.zMaxYz = self.height;
                }
                i ++;
            }
        }
    }
}


- (void)menuReleaseDawn:(UIButton *)sender{
    
    for (UIButton *button in self.subviews) {
        if ([button isMemberOfClass:[UIButton class]]) {
            button.selected = NO;
        }
    }
    sender.selected = YES;
    
    
    if (_bLastViewb.tMaxXt > self.width) {
        if (sender.x >= self.width / 2 && sender.centerX <= self.contentSize.width - self.width/2) {
            [UIView animateWithDuration:0.3 animations:^{
                self.contentOffset = CGPointMake(sender.centerX - self.width / 2, 0);
            }];
        }else if (sender.frame.origin.x < self.width / 2){
            [UIView animateWithDuration:0.3 animations:^{
                self.contentOffset = CGPointMake(0, 0);
            }];
        }else{
            [UIView animateWithDuration:0.3 animations:^{
                self.contentOffset = CGPointMake(self.contentSize.width - self.width, 0);
            }];
        }
    }
    
    
    [UIView animateWithDuration:0.3 animations:^{
        _uLineViewu.width = sender.titleLabel.width;
        _uLineViewu.centerX = sender.centerX;
    }];
    
    
    if ([self.fareUnbuttonChatterDelegate respondsToSelector:@selector(coilFareHorizon:clickedButtonAtIndex:)]) {
        [self.fareUnbuttonChatterDelegate coilFareHorizon:self clickedButtonAtIndex:(sender.tag - 100)];
    }
}


- (void)setECurrentButtonIndexe:(NSInteger)eCurrentButtonIndexe{
    _eCurrentButtonIndexe = eCurrentButtonIndexe;
    
    
    UIButton *currentButton = [self viewWithTag:(100 + eCurrentButtonIndexe)];
    for (UIButton *button in self.subviews) {
        if ([button isMemberOfClass:[UIButton class]]) {
            button.selected = NO;
        }
    }
    currentButton.selected = YES;
    
    
    if (_bLastViewb.tMaxXt > self.width) {
        if (currentButton.x >= self.width / 2 && currentButton.centerX <= self.contentSize.width - self.width/2) {
            [UIView animateWithDuration:0.3 animations:^{
                self.contentOffset = CGPointMake(currentButton.centerX - self.width / 2, 0);
            }];
        }else if (currentButton.x < self.width / 2){
            [UIView animateWithDuration:0.3 animations:^{
                self.contentOffset = CGPointMake(0, 0);
            }];
        }else{
            [UIView animateWithDuration:0.3 animations:^{
                self.contentOffset = CGPointMake(self.contentSize.width - self.width, 0);
            }];
        }
    }
    
    
    [UIView animateWithDuration:0.3 animations:^{
        _uLineViewu.width = currentButton.titleLabel.width;
        _uLineViewu.centerX = currentButton.centerX;
    }];
}

@end
