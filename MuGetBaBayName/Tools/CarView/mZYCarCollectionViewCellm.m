
#import "mZYCarCollectionViewCellm.h"

@interface mZYCarCollectionViewCellm()

@end
@implementation mZYCarCollectionViewCellm

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.shadowRadius = 6.0f;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 6.0f;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.masksToBounds = NO;
    
    ViewBorderRadius(_zJiexiLabelz, 10.5, 1, KGrayColor);
    
}

-(void)setModel:(eZYCarModele *)model{
    _model = model;
   
    self.imageView.image = [UIImage imageNamed:model.gImageUrlg];
    self.xLabel1x.text = model.tPinyinStrt;
    self.nLabel2n.text = model.tNameStrt;
    self.bLabel3b.text = model.cWuxingStrc;
}
@end
