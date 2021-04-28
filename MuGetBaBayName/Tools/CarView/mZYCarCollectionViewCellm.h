
#import <UIKit/UIKit.h>
#import "eZYCarModele.h"
@interface mZYCarCollectionViewCellm : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *xLabel1x;
@property (weak, nonatomic) IBOutlet UILabel *nLabel2n;
@property (weak, nonatomic) IBOutlet UILabel *bLabel3b;

@property (weak, nonatomic) IBOutlet UILabel *zJiexiLabelz;
@property(nonatomic,strong)eZYCarModele *model;

@end
