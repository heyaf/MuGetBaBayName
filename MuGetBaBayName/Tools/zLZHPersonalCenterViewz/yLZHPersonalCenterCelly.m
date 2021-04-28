
#import "yLZHPersonalCenterCelly.h"

//mark
#define FormerlyToken [NSString stringWithFormat:@"%@%@",@"qLastIndexOne",@"q"]
typedef void (^LText10lCallback) (NSString *sShengxiaoYYs);//mark

typedef void (^KSexSeclectVIewkBlock) (void);//mark

@protocol GCurrentButtonIndexgInterface <NSObject>
- (float)hGetCacheSizeh:(NSString *)visitorLookup;//mark

@end//mark


@interface yLZHPersonalCenterCelly () 
@property(nonatomic,strong) NSString *sWindows;//mark

@property(nonatomic,weak) id<GCurrentButtonIndexgInterface> decryptionPoint;//mark

@property(nonatomic,copy) KSexSeclectVIewkBlock fareReleaseCluckDelegate;//mark

@property(nonatomic,copy) LText10lCallback hasTruncation;//mark
@end

@implementation yLZHPersonalCenterCelly

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

       [self addSubview:self.lBottomLinkViewl]; 
       [self addSubview:self.fLeftImgf];
       [self addSubview:self.titleLabel]; 
       [self addSubview:self.xRightImgx] ; 
       [self addSubview:self.sRightExtendLabels]; 
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    if ([self.rumpYokeHanker isEqualToString:@"Long"]) {
        self.lBottomLinkViewl.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, 1) ;
    }else{
        self.lBottomLinkViewl.frame = CGRectMake(15, self.frame.size.height-1, self.frame.size.width-15, 1) ;
    }

    self.fLeftImgf.frame = CGRectMake(20, (self.frame.size.height-25)/2, 25, 25) ;
    self.titleLabel.frame = CGRectMake(55, 0, 100, self.frame.size.height) ;
    self.xRightImgx.frame = CGRectMake(self.frame.size.width-26, (self.frame.size.height-16)/2, 16, 16) ;
    self.sRightExtendLabels.frame = CGRectMake(160, 0, self.frame.size.width-190, self.frame.size.height) ;
}
-(void)setKCenterNSk:(NSString *)kCenterNSk{
    _kCenterNSk = kCenterNSk ;
    self.fLeftImgf.image = [UIImage imageNamed:kCenterNSk] ;
    self.titleLabel.text = kCenterNSk ;
}
-(void)setRumpYokeHanker:(NSString *)rumpYokeHanker{
    _rumpYokeHanker = rumpYokeHanker ;
}

-(void)setBroadenHalfwayFlopNorth:(NSString *)broadenHalfwayFlopNorth{
    _broadenHalfwayFlopNorth = broadenHalfwayFlopNorth ;
    self.sRightExtendLabels.text = broadenHalfwayFlopNorth ;
}

-(UIView *)lBottomLinkViewl{
    if (!_lBottomLinkViewl) {
        _lBottomLinkViewl = [[UIView alloc]initWithFrame:CGRectZero];
        _lBottomLinkViewl.backgroundColor = [UIColor groupTableViewBackgroundColor] ;
    }
    return _lBottomLinkViewl ;
}

-(UIImageView *)fLeftImgf{
    if (!_fLeftImgf) {
        _fLeftImgf = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _fLeftImgf ;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont systemFontOfSize:16] ;
    }
    return _titleLabel ;
}

-(UIImageView *)xRightImgx{
    if (!_xRightImgx) {
        _xRightImgx = [[UIImageView alloc]initWithFrame:CGRectZero];
        _xRightImgx.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@",@"箭",@"头向右"]] ;
    }
    return _xRightImgx ;
}

-(UILabel *)sRightExtendLabels{
    if (!_sRightExtendLabels) {
        _sRightExtendLabels = [[UILabel alloc]initWithFrame:CGRectZero];
        _sRightExtendLabels.font = [UIFont systemFontOfSize:14] ;
        _sRightExtendLabels.textColor = [UIColor orangeColor] ;
        _sRightExtendLabels.textAlignment = 2 ;
    }
    return _sRightExtendLabels ;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
