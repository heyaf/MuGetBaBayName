
#import "rZYCarViewLayoutr.h"


//mark
#define ReuseJailCellID [NSString stringWithFormat:@"%@%@%@",@"kOnceToke",@"n",@"k"]
typedef void (^RDateStrrComplete) (NSString *iBottomLinkViewi);//mark


typedef void (^RightDigestComplete) (void);//mark

@protocol ChiRepresentationInterface <NSObject>
- (NSString *)lCreatUIl:(double)pBottomLinkViewp jSelectedImagej:(NSString *)vDateStrv;//mark

@end//mark

#define hINTERSPACEPARAMh  0.90
@interface rZYCarViewLayoutr()
@property (nonatomic, assign) CGFloat hViewWidthh;
@property (nonatomic, assign) CGFloat hItemHeighth;
@property (nonatomic, assign) CGFloat eLastDirectionIndexe;
@property (nonatomic, assign) CGFloat slewDistance;
@property (nonatomic, strong) NSIndexPath *xLastIndexOnex;
@property(nonatomic,strong) NSString *iDateStri;//mark

@property(nonatomic,weak) id<ChiRepresentationInterface> wShengxiaoJYw;//mark
@property(nonatomic,copy) RightDigestComplete nXingStrn;//mark

@property(nonatomic,copy) RDateStrrComplete oTextfile2o;//mark

@end
@implementation rZYCarViewLayoutr
-(void)prepareLayout{
    [super prepareLayout];
    self.xVisibleCountx = 7;
    self.hViewWidthh = CGRectGetWidth(self.collectionView.frame);
    self.hItemHeighth = self.itemSize.width;
}

-(CGSize)collectionViewContentSize{
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
        return CGSizeMake(CGRectGetWidth(self.collectionView.frame), cellCount * self.hItemHeighth);
    }
    return CGSizeMake(cellCount * self.hItemHeighth, CGRectGetHeight(self.collectionView.frame));
}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    CGFloat tCenterYt = self.collectionView.contentOffset.x + self.hViewWidthh/2;
    NSInteger index = tCenterYt/self.hItemHeighth;
    NSInteger count = (self.xVisibleCountx - 1) / 2;
    NSInteger minIndex = MAX(0, (index - count));
    NSInteger maxIndex = MIN((cellCount - 1), (index + count));
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = minIndex; i <= maxIndex; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [array addObject:attributes];
    }
    return array;
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = self.itemSize;
    CGFloat cY = self.collectionView.contentOffset.x + self.hViewWidthh / 2;
    CGFloat attributesY = self.hItemHeighth * indexPath.row + self.hItemHeighth / 2;
    attributes.zIndex = -ABS(attributesY - cY);
    CGFloat delta = cY - attributesY;
    CGFloat ratio =  - delta / (self.hItemHeighth * 2);
    CGFloat scale = 1 - ABS(delta) / (self.hItemHeighth * 6.0) * cos(ratio * M_2_PI*0.9);
    attributes.transform = CGAffineTransformMakeScale(scale, scale);
    CGFloat tCenterYt = attributesY;

    if (scale>0.999){
        self.xLastIndexOnex = indexPath;
    }
    if (self.xLastIndexOnex == indexPath) {
        CGFloat index1 = 0.0f;
        if ([self wJudgeDirectionw:tCenterYt]) {
            index1 = 2;
        }else{
            index1 = -2;
        }
        tCenterYt = cY + sin(ratio * 1.31) * self.hItemHeighth * hINTERSPACEPARAMh*2.2+index1;
        
        
        if (scale <= 0.84){
            if ([self wJudgeDirectionw:tCenterYt]) {
                NSIndexPath *indexNext = [NSIndexPath indexPathForRow:self.xLastIndexOnex.row+1 inSection:0];
                self.xLastIndexOnex = indexNext;
            }else{
                NSIndexPath *indexNext = [NSIndexPath indexPathForRow:self.xLastIndexOnex.row-1 inSection:0];
                self.xLastIndexOnex = indexNext;
            }
        }
        if (scale <=0.9172) {
            CGFloat sinIndex = sin(ratio * 1.31) * self.hItemHeighth * hINTERSPACEPARAMh*2.7+index1;
            if ([self wJudgeDirectionw:tCenterYt]) {
                tCenterYt = tCenterYt-(sinIndex+(self.itemSize.width*96/124));
                
            }else{
                tCenterYt = tCenterYt-(sinIndex-(self.itemSize.width*96/124));
            }
        }
        self.eLastDirectionIndexe = tCenterYt;
    }else{
        tCenterYt = cY + sin(ratio * 1.217) * self.hItemHeighth * hINTERSPACEPARAMh;
    }
    attributes.center = CGPointMake(tCenterYt, CGRectGetHeight(self.collectionView.frame) / 2);
    return attributes;
}
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGFloat index = roundf((proposedContentOffset.x+ self.hViewWidthh / 2 - self.hItemHeighth / 2) / self.hItemHeighth);
    proposedContentOffset.x = self.hItemHeighth * index + self.hItemHeighth / 2 - self.hViewWidthh / 2;
    return proposedContentOffset;
}
-(BOOL)wJudgeDirectionw:(CGFloat )index{
    if (self.eLastDirectionIndexe>index) {
        return YES;
    }else{
        return NO;
    }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
