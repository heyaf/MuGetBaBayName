
#define iDURATION_TIMEi 0.1

#import "LinkTextbookTheatre.h"

//mark
#define ROnceTokenr [NSString stringWithFormat:@"%@%@%@%@",@"zMU",@"i",@"d",@"z"]

typedef void (^ComputerMenuUnbuttonClickedDelegateComplete) (BOOL mImageUrlm);//mark

@interface LinkTextbookTheatre()<UITextFieldDelegate>

@property (nonatomic,strong) NSString *lPlaceholderTextl;

@property (nonatomic,strong) UILabel *textbook171;

@property (nonatomic,strong) UILabel *tText2t;

@property (nonatomic,strong) UILabel *dText3d;

@property (nonatomic,strong) UILabel *schoolText198;

@property (nonatomic,strong) UILabel *uText5u;

@property (nonatomic,strong) UILabel *aText6a;

@property (nonatomic,strong) UILabel *nText7n;

@property (nonatomic,strong) UILabel *jText8j;

@property (nonatomic,strong) UILabel *aText9a;

@property (nonatomic,strong) UILabel *uText10u;

@property (nonatomic,assign) CGRect zTextFieldFramez;

@property(nonatomic,assign) NSInteger fFirstnamef;//mark

@property(nonatomic,copy) ComputerMenuUnbuttonClickedDelegateComplete iXingStri;//mark

@end

@implementation LinkTextbookTheatre

-(instancetype)initWithFrame:(CGRect)frame sWithIcons:(NSString *)iconName kWithPlaceholderTextk:(NSString *)placeText{
    self = [super init];
    if (self) {
        
        self.lPlaceholderTextl = placeText;
        
        CGFloat margin = 10;
        CGFloat iconW = 20;
        CGFloat iconH = 20;
        
        UIImageView *icon = [[UIImageView alloc]init];
        icon.image = [UIImage imageNamed:iconName];
        icon.frame = CGRectMake(margin, margin, iconW, iconH);
        [self addSubview:icon];
        
        UIImageView *line = [[UIImageView alloc]init];
        line.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@%@",@"dl_short_",@"lin",@"e"]];
        line.frame = CGRectMake(CGRectGetMaxX(icon.frame) + margin, margin, 2, iconH);
        [self addSubview:line];
        
        UITextField *zInputTextz = [[UITextField alloc]init];
        zInputTextz.textColor = [UIColor whiteColor];

        zInputTextz.font = [UIFont systemFontOfSize:18]; 
        self.zTextFieldFramez = CGRectMake(CGRectGetMaxX(line.frame) + margin, margin, frame.size.width - CGRectGetMaxX(line.frame) - (2 * margin), iconH);
        zInputTextz.frame = self.zTextFieldFramez;
        zInputTextz.delegate = self;
        self.zInputTextz = zInputTextz;
        [self.zInputTextz setReturnKeyType:UIReturnKeyNext];
        [self addSubview:zInputTextz];
        
        UIImageView *downLine = [[UIImageView alloc]init];
        downLine.frame = CGRectMake(0, CGRectGetMaxY(icon.frame) + margin, frame.size.width, 2);
        downLine.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:0.5];
        [self addSubview:downLine];
        
        [self screenAnnul];
    }
    return self;
}

-(UILabel *)aMakeWithFramea:(CGRect)frame xWithRangex:(int)range
{
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(self.zTextFieldFramez.origin.x + 20 * range, self.zTextFieldFramez.origin.y, 20, 20);
    NSRange ranges = NSMakeRange(range, 1);
    label.textColor = [UIColor grayColor];
    label.text = [self.lPlaceholderTextl substringWithRange:ranges];
    return label;
}

-(void)screenAnnul
{
    for (int i = 0; i < self.lPlaceholderTextl.length; i ++) {
        if (i == 0) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.textbook171 = [self aMakeWithFramea:frame xWithRangex:i];
            [self addSubview:self.textbook171];
        }else if (i == 1) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.tText2t = [self aMakeWithFramea:frame xWithRangex:i];
            [self addSubview:self.tText2t];
        }else if (i == 2) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.dText3d = [self aMakeWithFramea:frame xWithRangex:i];
            [self addSubview:self.dText3d];
        }else if (i == 3) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.schoolText198 = [self aMakeWithFramea:frame xWithRangex:i];
            [self addSubview:self.schoolText198];
        }else if (i == 4) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.uText5u = [self aMakeWithFramea:frame xWithRangex:i];
            [self addSubview:self.uText5u];
        }else if (i == 5) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.aText6a = [self aMakeWithFramea:frame xWithRangex:i];
            [self addSubview:self.aText6a];
        }else if (i == 6) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.nText7n = [self aMakeWithFramea:frame xWithRangex:i];
            [self addSubview:self.nText7n];
        }else if (i == 7) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.jText8j = [self aMakeWithFramea:frame xWithRangex:i];
            [self addSubview:self.jText8j];
        }else if (i == 8) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.aText9a = [self aMakeWithFramea:frame xWithRangex:i];
            [self addSubview:self.aText9a];
        }else if (i == 9) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.uText10u = [self aMakeWithFramea:frame xWithRangex:i];
            [self addSubview:self.uText10u];
        }
    }
    
    [self bringSubviewToFront:self.zInputTextz];
}

-(void)tallyBeginSpiritednessAppropriateTag:(UILabel *)label wWithIndexw:(CGFloat)index
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((iDURATION_TIMEi * 0.5) * index * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CGRect frame = label.frame;
        CABasicAnimation *aniBounds = [CABasicAnimation animationWithKeyPath:[NSString stringWithFormat:@"%@%@%@",@"b",@"ound",@"s"]];
        aniBounds.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, CGRectGetWidth(frame), 0)];
        aniBounds.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        
        CABasicAnimation *aniScale = [CABasicAnimation animationWithKeyPath:[NSString stringWithFormat:@"%@%@%@",@"transf",@"orm.scal",@"e"]];
        aniScale.fromValue = [NSNumber numberWithFloat:1.0];
        aniScale.toValue = [NSNumber numberWithFloat:0.8];
        
        CABasicAnimation *aniPosition = [CABasicAnimation animationWithKeyPath:[NSString stringWithFormat:@"%@%@%@%@",@"p",@"o",@"sitio",@"n"]];
        aniPosition.fromValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMinX(frame), label.frame.origin.y)];
        aniPosition.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMinX(frame) - index * 4, label.frame.origin.y - 10)];
        
        CABasicAnimation *aniAnchorPoint = [CABasicAnimation animationWithKeyPath:[NSString stringWithFormat:@"%@%@%@%@%@%@",@"ancho",@"r",@"P",@"o",@"i",@"nt"]];
        aniAnchorPoint.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 1)];
        aniAnchorPoint.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 1)];
        
        
        CAAnimationGroup *anis = [CAAnimationGroup animation];
        anis.animations = @[aniBounds,aniPosition,aniScale,aniAnchorPoint];
        anis.duration = iDURATION_TIMEi;
        anis.removedOnCompletion = NO;
        anis.fillMode = kCAFillModeForwards;
        [label.layer addAnimation:anis forKey:nil];
    });
}

-(void)textualMatterEndRedact
{
    [self tallyBeginSpiritednessAppropriateTag:self.textbook171 wWithIndexw:0];
    [self tallyBeginSpiritednessAppropriateTag:self.tText2t wWithIndexw:1];
    [self tallyBeginSpiritednessAppropriateTag:self.dText3d wWithIndexw:2];
    [self tallyBeginSpiritednessAppropriateTag:self.schoolText198 wWithIndexw:3];
    [self tallyBeginSpiritednessAppropriateTag:self.uText5u wWithIndexw:4];
    [self tallyBeginSpiritednessAppropriateTag:self.aText6a wWithIndexw:5];
    [self tallyBeginSpiritednessAppropriateTag:self.nText7n wWithIndexw:6];
    [self tallyBeginSpiritednessAppropriateTag:self.jText8j wWithIndexw:7];
    [self tallyBeginSpiritednessAppropriateTag:self.aText9a wWithIndexw:8];
    [self tallyBeginSpiritednessAppropriateTag:self.uText10u wWithIndexw:9];
    
}

-(void)pAddEndAnimationWithLabelp:(UILabel *)label wWithIndexw:(CGFloat)index
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((iDURATION_TIMEi * 0.5) * index * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        CGRect frame = label.frame;
        CABasicAnimation *aniBounds = [CABasicAnimation animationWithKeyPath:[NSString stringWithFormat:@"%@%@%@",@"b",@"ound",@"s"]];
        aniBounds.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, CGRectGetWidth(frame), 0)];
        aniBounds.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        
        CABasicAnimation *aniAnchorPoint = [CABasicAnimation animationWithKeyPath:[NSString stringWithFormat:@"%@%@%@%@%@%@",@"ancho",@"r",@"P",@"o",@"i",@"nt"]];
        aniAnchorPoint.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 1)];
        aniAnchorPoint.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 1)];
        
        CABasicAnimation *aniPosition = [CABasicAnimation animationWithKeyPath:[NSString stringWithFormat:@"%@%@%@%@",@"p",@"o",@"sitio",@"n"]];
        aniPosition.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMinX(frame), label.frame.origin.y)];
        aniPosition.fromValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMinX(frame) - index * 4, label.frame.origin.y - 10)];
        
        CABasicAnimation *aniScale = [CABasicAnimation animationWithKeyPath:[NSString stringWithFormat:@"%@%@%@",@"transf",@"orm.scal",@"e"]];
        aniScale.fromValue = [NSNumber numberWithFloat:0.8];
        aniScale.toValue = [NSNumber numberWithFloat:1.0];
        
        
        CAAnimationGroup *anis = [CAAnimationGroup animation];
        anis.animations = @[aniBounds,aniPosition,aniScale,aniAnchorPoint];
        anis.duration = 0.1;
        anis.removedOnCompletion = NO;
        anis.fillMode = kCAFillModeForwards;
        [label.layer addAnimation:anis forKey:nil];
    });
}

-(void)fTextEndEditingf
{
    [self pAddEndAnimationWithLabelp:self.textbook171 wWithIndexw:0];
    [self pAddEndAnimationWithLabelp:self.tText2t wWithIndexw:1];
    [self pAddEndAnimationWithLabelp:self.dText3d wWithIndexw:2];
    [self pAddEndAnimationWithLabelp:self.schoolText198 wWithIndexw:3];
    [self pAddEndAnimationWithLabelp:self.uText5u wWithIndexw:4];
    [self pAddEndAnimationWithLabelp:self.aText6a wWithIndexw:5];
    [self pAddEndAnimationWithLabelp:self.nText7n wWithIndexw:6];
    [self pAddEndAnimationWithLabelp:self.jText8j wWithIndexw:7];
    [self pAddEndAnimationWithLabelp:self.aText9a wWithIndexw:8];
    [self pAddEndAnimationWithLabelp:self.uText10u wWithIndexw:9];

}

@end
